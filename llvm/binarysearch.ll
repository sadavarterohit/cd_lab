; ModuleID = 'binarysearch.c'
source_filename = "binarysearch.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [32 x i8] c"Element is not present in array\00", align 1
@.str.1 = private unnamed_addr constant [31 x i8] c"Element is present at index %d\00", align 1

; Function Attrs: nounwind readonly uwtable
define dso_local i32 @binarySearch(i32* readonly %0, i32 %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = icmp slt i32 %2, %1
  br i1 %5, label %26, label %6

6:                                                ; preds = %4, %23
  %7 = phi i32 [ %10, %23 ], [ %2, %4 ]
  %8 = phi i32 [ %24, %23 ], [ %1, %4 ]
  br label %9

9:                                                ; preds = %6, %20
  %10 = phi i32 [ %7, %6 ], [ %21, %20 ]
  %11 = sub nsw i32 %10, %8
  %12 = sdiv i32 %11, 2
  %13 = add nsw i32 %12, %8
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds i32, i32* %0, i64 %14
  %16 = load i32, i32* %15, align 4, !tbaa !2
  %17 = icmp eq i32 %16, %3
  br i1 %17, label %26, label %18

18:                                               ; preds = %9
  %19 = icmp sgt i32 %16, %3
  br i1 %19, label %20, label %23

20:                                               ; preds = %18
  %21 = add nsw i32 %13, -1
  %22 = icmp slt i32 %11, 2
  br i1 %22, label %26, label %9

23:                                               ; preds = %18
  %24 = add nsw i32 %13, 1
  %25 = icmp sgt i32 %10, %13
  br i1 %25, label %6, label %26

26:                                               ; preds = %23, %9, %20, %4
  %27 = phi i32 [ -1, %4 ], [ -1, %20 ], [ %13, %9 ], [ -1, %23 ]
  ret i32 %27
}

; Function Attrs: nounwind uwtable
define dso_local i32 @main() local_unnamed_addr #1 {
  br label %1

1:                                                ; preds = %11, %0
  %2 = phi i32 [ %5, %11 ], [ 4, %0 ]
  %3 = phi i32 [ %12, %11 ], [ 0, %0 ]
  br label %4

4:                                                ; preds = %9, %1
  %5 = phi i32 [ %2, %1 ], [ 3, %9 ]
  %6 = sub nsw i32 %5, %3
  %7 = sdiv i32 %6, 2
  %8 = add nsw i32 %7, %3
  switch i32 %8, label %11 [
    i32 3, label %16
    i32 4, label %9
  ]

9:                                                ; preds = %4
  %10 = icmp slt i32 %6, 2
  br i1 %10, label %14, label %4

11:                                               ; preds = %4
  %12 = add nsw i32 %8, 1
  %13 = icmp sgt i32 %5, %8
  br i1 %13, label %1, label %14

14:                                               ; preds = %11, %9
  %15 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0))
  br label %18

16:                                               ; preds = %4
  %17 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0), i32 3)
  br label %18

18:                                               ; preds = %16, %14
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
