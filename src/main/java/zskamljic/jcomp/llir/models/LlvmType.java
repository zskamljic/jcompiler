package zskamljic.jcomp.llir.models;

public sealed interface LlvmType {

    record Array(int length, LlvmType type) implements LlvmType {
        @Override
        public String toString() {
            return STR."[\{length} x \{type}]";
        }
    }

    record Declared(String type) implements LlvmType {
        @Override
        public String toString() {
            return STR."%\{type}";
        }
    }

    record Pointer(LlvmType type) implements LlvmType {

        @Override
        public String toString() {
            return STR."\{type.toString()}*";
        }
    }

    enum Primitive implements LlvmType {
        BOOLEAN,
        VOID,
        POINTER,
        // Signed integers
        BYTE,
        SHORT,
        INT,
        LONG,

        // Floating points
        FLOAT,
        DOUBLE;

        @Override
        public String toString() {
            return switch (this) {
                case VOID -> "void";
                case BOOLEAN -> "i1";
                case POINTER -> "ptr";
                case BYTE -> "i8";
                case SHORT -> "i16";
                case INT -> "i32";
                case LONG -> "i64";
                case FLOAT -> "float";
                case DOUBLE -> "double";
            };
        }
    }
}
