package zskamljic.jcomp;

import picocli.CommandLine;
import zskamljic.jcomp.llir.ClassBuilder;
import zskamljic.jcomp.llir.IrClassGenerator;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Objects;

public class Main {
    public static void main(String[] args) {
        var options = new CompilerParams();
        var commandLine = new CommandLine(options);
        try {
            commandLine.parseArgs(args);
        } catch (CommandLine.ParameterException e) {
            commandLine.usage(System.out);
            return;
        }

        try {
            var buildDir = options.outputDirectory;
            if (!Files.exists(buildDir)) {
                Files.createDirectory(buildDir);
            }
            var resolver = new StdLibResolver(Path.of("stdlib"));
            var generator = new ClassBuilder(resolver, options.inputClass, options.debug);

            var generatedFiles = generator.generate();

            var processes = ProcessBuilder.startPipeline(List.of(
                linkFiles(buildDir, generatedFiles),
                new ProcessBuilder("opt", "-S", "--O3"), // Optimize
                new ProcessBuilder("llc"), // Generate assembly
                new ProcessBuilder("clang", "-x", "assembler", "-") // Compile
            ));
            for (var process : processes) {
                process.waitFor();
                try (var error = process.getErrorStream()) {
                    var errorData = error.readAllBytes();
                    var errorString = new String(errorData, StandardCharsets.UTF_8);
                    if (!errorString.isBlank()) {
                        System.err.println(errorString);
                    }
                }
            }
            if (!options.debug) {
                Files.deleteIfExists(buildDir.resolve("IR.ll"));
            }
        } catch (IOException | InterruptedException e) {
            System.err.println(STR."Unable to parse class file \{options.inputClass}: \{e.getMessage()}");
        }
    }

    private static ProcessBuilder linkFiles(Path buildDir, Map<String, IrClassGenerator> files) throws IOException {
        var command = new ArrayList<>(List.of("llvm-link", "-S"));
        files.entrySet()
            .stream()
            .map(e -> {
                var fileName = STR."\{e.getKey()}.ll";
                try {
                    var filePath = buildDir.resolve(fileName);
                    if (!Files.exists(filePath.getParent())) {
                        Files.createDirectories(filePath.getParent());
                    }
                    Files.writeString(filePath, e.getValue().generate());
                } catch (IOException ex) {
                    throw new IllegalStateException("Unable to write file", ex);
                }
                return fileName;
            })
            .map(buildDir::resolve)
            .map(Objects::toString)
            .forEach(command::add);
        return new ProcessBuilder(command.toArray(new String[0]));
    }
}