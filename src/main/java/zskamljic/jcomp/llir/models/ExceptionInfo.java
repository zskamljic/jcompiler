package zskamljic.jcomp.llir.models;

import zskamljic.jcomp.llir.Utils;

public record ExceptionInfo(
    String tryStart,
    String tryEnd,
    String catchStart,
    LlvmType type,
    LlvmType.Global typeInfo
) {
    public static ExceptionInfo create(String tryStart, String tryEnd, String catchStart, LlvmType type) {
        LlvmType.Global typeInfo;
        if (type instanceof LlvmType.Declared(var name)) {
            typeInfo = new LlvmType.Global(Utils.escape(STR."P\{name}_type_info"));
        } else {
            typeInfo = null;
        }
        return new ExceptionInfo(tryStart, tryEnd, catchStart, type, typeInfo);
    }
}
