; ModuleID = 'interpol.c'
source_filename = "interpol.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@__const.main.arr = private unnamed_addr constant [15 x i32] [i32 10, i32 12, i32 13, i32 16, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 33, i32 35, i32 42, i32 47], align 16
@.str = private unnamed_addr constant [26 x i8] c"Element found at index %d\00", align 1
@.str.1 = private unnamed_addr constant [19 x i8] c"Element not found.\00", align 1

; Function Attrs: nounwind readonly uwtable
define dso_local i32 @interpolationSearch(i32* readonly %0, i32 %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = icmp slt i32 %2, %1
  br i1 %5, label %45, label %6

6:                                                ; preds = %4, %37
  %7 = phi i32 [ %17, %37 ], [ %2, %4 ]
  %8 = phi i32 [ %38, %37 ], [ %1, %4 ]
  %9 = sext i32 %8 to i64
  %10 = getelementptr inbounds i32, i32* %0, i64 %9
  %11 = load i32, i32* %10, align 4, !tbaa !2
  %12 = icmp sgt i32 %11, %3
  %13 = sitofp i32 %8 to double
  %14 = sub nsw i32 %3, %11
  %15 = sitofp i32 %14 to double
  br i1 %12, label %45, label %16

16:                                               ; preds = %6, %42
  %17 = phi i32 [ %43, %42 ], [ %7, %6 ]
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds i32, i32* %0, i64 %18
  %20 = load i32, i32* %19, align 4, !tbaa !2
  %21 = icmp slt i32 %20, %3
  br i1 %21, label %45, label %22

22:                                               ; preds = %16
  %23 = sub nsw i32 %17, %8
  %24 = sitofp i32 %23 to double
  %25 = sub nsw i32 %20, %11
  %26 = sitofp i32 %25 to double
  %27 = fdiv double %24, %26
  %28 = fmul double %27, %15
  %29 = fadd double %28, %13
  %30 = fptosi double %29 to i32
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds i32, i32* %0, i64 %31
  %33 = load i32, i32* %32, align 4, !tbaa !2
  %34 = icmp eq i32 %33, %3
  br i1 %34, label %45, label %35

35:                                               ; preds = %22
  %36 = icmp slt i32 %33, %3
  br i1 %36, label %37, label %40

37:                                               ; preds = %35
  %38 = add nsw i32 %30, 1
  %39 = icmp sgt i32 %17, %30
  br i1 %39, label %6, label %45

40:                                               ; preds = %35
  %41 = icmp sgt i32 %33, %3
  br i1 %41, label %42, label %45

42:                                               ; preds = %40
  %43 = add nsw i32 %30, -1
  %44 = icmp slt i32 %8, %30
  br i1 %44, label %16, label %45

45:                                               ; preds = %37, %6, %42, %22, %16, %40, %4
  %46 = phi i32 [ -1, %4 ], [ -1, %40 ], [ -1, %42 ], [ -1, %16 ], [ %30, %22 ], [ -1, %6 ], [ -1, %37 ]
  ret i32 %46
}

; Function Attrs: nounwind uwtable
define dso_local i32 @main() local_unnamed_addr #1 {
  br label %1

1:                                                ; preds = %26, %0
  %2 = phi i32 [ %11, %26 ], [ 14, %0 ]
  %3 = phi i32 [ %27, %26 ], [ 0, %0 ]
  %4 = zext i32 %3 to i64
  %5 = getelementptr inbounds [15 x i32], [15 x i32]* @__const.main.arr, i64 0, i64 %4
  %6 = load i32, i32* %5, align 4, !tbaa !2
  %7 = sitofp i32 %3 to double
  %8 = sub nsw i32 18, %6
  %9 = sitofp i32 %8 to double
  br label %10

10:                                               ; preds = %1, %29
  %11 = phi i32 [ %30, %29 ], [ %2, %1 ]
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds [15 x i32], [15 x i32]* @__const.main.arr, i64 0, i64 %12
  %14 = load i32, i32* %13, align 4, !tbaa !2
  %15 = sub nsw i32 %11, %3
  %16 = sitofp i32 %15 to double
  %17 = sub nsw i32 %14, %6
  %18 = sitofp i32 %17 to double
  %19 = fdiv double %16, %18
  %20 = fmul double %19, %9
  %21 = fadd double %20, %7
  %22 = fptosi double %21 to i32
  %23 = icmp eq i32 %22, 4
  br i1 %23, label %32, label %24

24:                                               ; preds = %10
  %25 = icmp ult i32 %22, 4
  br i1 %25, label %26, label %29

26:                                               ; preds = %24
  %27 = add nuw nsw i32 %22, 1
  %28 = icmp sgt i32 %11, %22
  br i1 %28, label %1, label %34

29:                                               ; preds = %24
  %30 = add nsw i32 %22, -1
  %31 = icmp slt i32 %3, %22
  br i1 %31, label %10, label %34

32:                                               ; preds = %10
  %33 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([26 x i8], [26 x i8]* @.str, i64 0, i64 0), i32 4)
  br label %36

34:                                               ; preds = %26, %29
  %35 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([19 x i8], [19 x i8]* @.str.1, i64 0, i64 0))
  br label %36

36:                                               ; preds = %34, %32
  ret i32 0
}

; Function Attrs: nofree nounwind
declare dso_local i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #2

attributes #0 = { nounwind readonly uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nofree nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 10.0.0-4ubuntu1 "}
!2 = !{!3, !3, i64 0}
!3 = !{!"int", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
