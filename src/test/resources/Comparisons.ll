%"java/lang/Object" = type { ptr }

declare void @"java/lang/Object_<init>"(%"java/lang/Object"*)

declare i1 @"java/lang/Object_equals"(%"java/lang/Object"*, %"java/lang/Object")
declare void @"java/lang/Object_notify"(%"java/lang/Object"*) nounwind
declare void @"java/lang/Object_notifyAll"(%"java/lang/Object"*) nounwind
declare void @"java/lang/Object_wait0"(%"java/lang/Object"*, i64) nounwind
declare void @"java/lang/Object_finalize"(%"java/lang/Object"*)

%Comparisons_vtable_type = type { i1(%"java/lang/Object"*, %"java/lang/Object")*, void(%"java/lang/Object"*)* }

%Comparisons = type { %Comparisons_vtable_type* }

declare i32 @__gxx_personality_v0(...)

@Comparisons_vtable_data = global %Comparisons_vtable_type {
  i1(%"java/lang/Object"*, %"java/lang/Object")* @"java/lang/Object_equals",
  void(%"java/lang/Object"*)* @"java/lang/Object_finalize"
}

define void @"Comparisons_<init>"(%Comparisons* %this) personality ptr @__gxx_personality_v0 {
label0:
  ; Line 1
  call void @"java/lang/Object_<init>"(%"java/lang/Object"* %this)
  %0 = getelementptr inbounds %Comparisons, %Comparisons* %this, i64 0, i32 0
  store %Comparisons_vtable_type* @Comparisons_vtable_data, %Comparisons_vtable_type** %0
  ret void
}

define i32 @main() personality ptr @__gxx_personality_v0 {
  ; Line 3
  %1 = alloca %Comparisons
  call void @"Comparisons_<init>"(%Comparisons* %1)
  %local.0 = alloca ptr
  store %Comparisons* %1, ptr %local.0
  br label %label0
label0:
  %2 = load %Comparisons*, ptr %local.0
  %a = bitcast ptr %2 to %Comparisons*
  ; Line 4
  %3 = alloca %Comparisons
  call void @"Comparisons_<init>"(%Comparisons* %3)
  %local.1 = alloca ptr
  store %Comparisons* %3, ptr %local.1
  br label %label2
label2:
  %4 = load %Comparisons*, ptr %local.1
  %b = bitcast ptr %4 to %Comparisons*
  ; Line 5
  %5 = icmp ne ptr %a, %a
  br i1 %5, label %label3, label %not_label3
not_label3:
  ; Line 6
  call void @printOk(i32 0)
  br label %label3
label3:
  ; Line 8
  %6 = icmp eq ptr %a, %b
  br i1 %6, label %label4, label %not_label4
not_label4:
  ; Line 9
  call void @printOk(i32 1)
  br label %label4
label4:
  ; Line 11
  call void @compare(i32 1)
  ; Line 12
  call void @compareZero(i32 0)
  ; Line 13
  call void @compareZero(i32 1)
  ; Line 14
  call void @compareLong(i64 0)
  ; Line 15
  call void @compareLong(i64 1)
  ; Line 16
  call void @compareLong(i64 -1)
  ; Line 17
  ret i32 0
}

define void @compare(i32 %value) personality ptr @__gxx_personality_v0 {
label0:
  ; Line 21
  %0 = icmp ne i32 %value, 1
  br i1 %0, label %label2, label %not_label2
not_label2:
  ; Line 22
  call void @printOk(i32 2)
  br label %label2
label2:
  ; Line 24
  %1 = icmp eq i32 %value, 2
  br i1 %1, label %label3, label %not_label3
not_label3:
  ; Line 25
  call void @printOk(i32 3)
  br label %label3
label3:
  ; Line 27
  %2 = icmp sge i32 %value, 2
  br i1 %2, label %label4, label %not_label4
not_label4:
  ; Line 28
  call void @printOk(i32 4)
  br label %label4
label4:
  ; Line 30
  %3 = icmp sle i32 2, %value
  br i1 %3, label %label5, label %not_label5
not_label5:
  ; Line 31
  call void @printOk(i32 5)
  br label %label5
label5:
  ; Line 33
  ret void
}

define void @compareZero(i32 %value) personality ptr @__gxx_personality_v0 {
label0:
  ; Line 36
  %0 = icmp ne i32 %value, 0
  br i1 %0, label %label2, label %not_label2
not_label2:
  ; Line 37
  call void @printOk(i32 6)
  br label %label2
label2:
  ; Line 39
  %1 = icmp eq i32 %value, 0
  br i1 %1, label %label3, label %not_label3
not_label3:
  ; Line 40
  call void @printOk(i32 7)
  br label %label3
label3:
  ; Line 42
  %2 = icmp sge i32 %value, 0
  br i1 %2, label %label4, label %not_label4
not_label4:
  ; Line 43
  call void @printOk(i32 8)
  br label %label4
label4:
  ; Line 45
  %3 = icmp slt i32 %value, 0
  br i1 %3, label %label5, label %not_label5
not_label5:
  ; Line 46
  call void @printOk(i32 9)
  br label %label5
label5:
  ; Line 48
  %4 = icmp sgt i32 %value, 0
  br i1 %4, label %label6, label %not_label6
not_label6:
  ; Line 49
  call void @printOk(i32 10)
  br label %label6
label6:
  ; Line 51
  ret void
}

define void @compareLong(i64 %l) personality ptr @__gxx_personality_v0 {
label0:
  ; Line 54
  %0 = alloca i32
  %1 = icmp slt i64 %l, 0
  br i1 %1, label %label3, label %label4
label3:
  store i32 -1, i32* %0
  br label %label2
label4:
  %2 = icmp sgt i64 %l, 0
  br i1 %2, label %label5, label %label6
label5:
  store i32 1, i32* %0
  br label %label2
label6:
  store i32 0, i32* %0
  br label %label2
label2:
  %3 = load i32, i32* %0
  %4 = icmp ne i32 %3, 0
  br i1 %4, label %label7, label %not_label7
not_label7:
  ; Line 55
  call void @printOk(i32 11)
  br label %label7
label7:
  ; Line 57
  %5 = alloca i32
  %6 = icmp slt i64 %l, 0
  br i1 %6, label %label9, label %label10
label9:
  store i32 -1, i32* %5
  br label %label8
label10:
  %7 = icmp sgt i64 %l, 0
  br i1 %7, label %label11, label %label12
label11:
  store i32 1, i32* %5
  br label %label8
label12:
  store i32 0, i32* %5
  br label %label8
label8:
  %8 = load i32, i32* %5
  %9 = icmp sle i32 %8, 0
  br i1 %9, label %label13, label %not_label13
not_label13:
  ; Line 58
  call void @printOk(i32 12)
  br label %label13
label13:
  ; Line 60
  %10 = alloca i32
  %11 = icmp slt i64 %l, 0
  br i1 %11, label %label15, label %label16
label15:
  store i32 -1, i32* %10
  br label %label14
label16:
  %12 = icmp sgt i64 %l, 0
  br i1 %12, label %label17, label %label18
label17:
  store i32 1, i32* %10
  br label %label14
label18:
  store i32 0, i32* %10
  br label %label14
label14:
  %13 = load i32, i32* %10
  %14 = icmp sge i32 %13, 0
  br i1 %14, label %label19, label %not_label19
not_label19:
  ; Line 61
  call void @printOk(i32 13)
  br label %label19
label19:
  ; Line 63
  ret void
}

define void @printOk(i32 %count) personality ptr @__gxx_personality_v0 {
label0:
  ; Line 66
  %0 = add i32 48, %count
  %local.1 = alloca ptr
  store i32 %0, ptr %local.1
  br label %label2
label2:
  %c = bitcast ptr %local.1 to i8*
  ; Line 67
  %1 = alloca [5 x i8]
  %2 = getelementptr inbounds [5 x i8], ptr %1, i64 0, i32 0
  store i8 79, ptr %2
  %3 = getelementptr inbounds [5 x i8], ptr %1, i64 0, i32 1
  store i8 75, ptr %3
  %4 = getelementptr inbounds [5 x i8], ptr %1, i64 0, i32 2
  store i8 35, ptr %4
  %5 = getelementptr inbounds [5 x i8], ptr %1, i64 0, i32 3
  %6 = load i8, i8* %c
  store i8 %6, ptr %5
  %7 = getelementptr inbounds [5 x i8], ptr %1, i64 0, i32 4
  store i8 0, ptr %7
  %8 = call i32 @puts(ptr %1)
  ; Line 68
  ret void
}

declare i32 @puts(ptr) nounwind
