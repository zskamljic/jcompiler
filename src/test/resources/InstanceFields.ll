%"java/lang/Object" = type { ptr }

declare void @"java/lang/Object_<init>()V"(%"java/lang/Object"*)

declare i32 @"java/lang/Object_hashCode()I"(%"java/lang/Object"*) nounwind
declare i1 @"java/lang/Object_equals(Ljava/lang/Object;)Z"(%"java/lang/Object"*, %"java/lang/Object")
declare void @"java/lang/Object_notify()V"(%"java/lang/Object"*) nounwind
declare void @"java/lang/Object_notifyAll()V"(%"java/lang/Object"*) nounwind
declare void @"java/lang/Object_wait0(J)V"(%"java/lang/Object"*, i64) nounwind
declare void @"java/lang/Object_finalize()V"(%"java/lang/Object"*)

%InstanceFields_vtable_type = type { i32(%"java/lang/Object"*)*, i1(%"java/lang/Object"*, %"java/lang/Object")*, void(%"java/lang/Object"*)* }

%InstanceFields = type { %InstanceFields_vtable_type*, i32, float, double }

declare i32 @__gxx_personality_v0(...)

@InstanceFields_vtable_data = global %InstanceFields_vtable_type {
  i32(%"java/lang/Object"*)* @"java/lang/Object_hashCode()I",
  i1(%"java/lang/Object"*, %"java/lang/Object")* @"java/lang/Object_equals(Ljava/lang/Object;)Z",
  void(%"java/lang/Object"*)* @"java/lang/Object_finalize()V"
}

define void @"InstanceFields_<init>()V"(%InstanceFields* %this) personality ptr @__gxx_personality_v0 {
label0:
  ; Line 6
  call void @"java/lang/Object_<init>()V"(%"java/lang/Object"* %this)
  %0 = getelementptr inbounds %InstanceFields, %InstanceFields* %this, i64 0, i32 0
  store %InstanceFields_vtable_type* @InstanceFields_vtable_data, %InstanceFields_vtable_type** %0
  ; Line 7
  %1 = getelementptr inbounds %InstanceFields, %InstanceFields* %this, i64 0, i32 1
  store i32 1, i32* %1
  ; Line 8
  %2 = getelementptr inbounds %InstanceFields, %InstanceFields* %this, i64 0, i32 2
  store float 5.0, float* %2
  ; Line 9
  %3 = getelementptr inbounds %InstanceFields, %InstanceFields* %this, i64 0, i32 3
  store double 7.0, double* %3
  ; Line 10
  ret void
}

define i32 @main() personality ptr @__gxx_personality_v0 {
  ; Line 13
  %1 = alloca %InstanceFields
  call void @"InstanceFields_<init>()V"(%InstanceFields* %1)
  %local.0 = alloca ptr
  store %InstanceFields* %1, ptr %local.0
  br label %label0
label0:
  %2 = load %InstanceFields*, ptr %local.0
  %instance = bitcast ptr %2 to %InstanceFields*
  ; Line 14
  %3 = alloca [4 x i8]
  %4 = getelementptr inbounds [4 x i8], ptr %3, i64 0, i32 0
  store i8 37, ptr %4
  %5 = getelementptr inbounds [4 x i8], ptr %3, i64 0, i32 1
  store i8 100, ptr %5
  %6 = getelementptr inbounds [4 x i8], ptr %3, i64 0, i32 2
  store i8 10, ptr %6
  %7 = getelementptr inbounds [4 x i8], ptr %3, i64 0, i32 3
  store i8 0, ptr %7
  %8 = alloca [1 x i32]
  %9 = getelementptr inbounds %InstanceFields, %InstanceFields* %instance, i64 0, i32 1
  %10 = load i32, i32* %9
  %11 = getelementptr inbounds [1 x i32], ptr %8, i64 0, i32 0
  store i32 %10, ptr %11
  %12 = getelementptr inbounds [1 x i32], ptr %8, i64 0, i32 0
  %13 = load i32, i32* %12
  %14 = call i32 @printf(ptr %3, i32 %13)
  ; Line 15
  %15 = alloca [4 x i8]
  %16 = getelementptr inbounds [4 x i8], ptr %15, i64 0, i32 0
  store i8 37, ptr %16
  %17 = getelementptr inbounds [4 x i8], ptr %15, i64 0, i32 1
  store i8 102, ptr %17
  %18 = getelementptr inbounds [4 x i8], ptr %15, i64 0, i32 2
  store i8 10, ptr %18
  %19 = getelementptr inbounds [4 x i8], ptr %15, i64 0, i32 3
  store i8 0, ptr %19
  %20 = alloca [1 x float]
  %21 = getelementptr inbounds %InstanceFields, %InstanceFields* %instance, i64 0, i32 2
  %22 = load float, float* %21
  %23 = getelementptr inbounds [1 x float], ptr %20, i64 0, i32 0
  store float %22, ptr %23
  %24 = getelementptr inbounds [1 x float], ptr %20, i64 0, i32 0
  %25 = load float, float* %24
  %26 = fpext float %25 to double
  %27 = call i32 @printf(ptr %15, double %26)
  ; Line 16
  %28 = alloca [4 x i8]
  %29 = getelementptr inbounds [4 x i8], ptr %28, i64 0, i32 0
  store i8 37, ptr %29
  %30 = getelementptr inbounds [4 x i8], ptr %28, i64 0, i32 1
  store i8 102, ptr %30
  %31 = getelementptr inbounds [4 x i8], ptr %28, i64 0, i32 2
  store i8 10, ptr %31
  %32 = getelementptr inbounds [4 x i8], ptr %28, i64 0, i32 3
  store i8 0, ptr %32
  %33 = alloca [1 x double]
  %34 = getelementptr inbounds %InstanceFields, %InstanceFields* %instance, i64 0, i32 3
  %35 = load double, double* %34
  %36 = getelementptr inbounds [1 x double], ptr %33, i64 0, i32 0
  store double %35, ptr %36
  %37 = getelementptr inbounds [1 x double], ptr %33, i64 0, i32 0
  %38 = load double, double* %37
  %39 = call i32 @printf(ptr %28, double %38)
  ; Line 17
  ret i32 0
}

declare i32 @printf(ptr, ...) nounwind
