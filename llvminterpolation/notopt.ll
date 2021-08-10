; ModuleID = 'interpol.c'
source_filename = "interpol.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@__const.main.arr = private unnamed_addr constant [15 x i32] [i32 10, i32 12, i32 13, i32 16, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 33, i32 35, i32 42, i32 47], align 16
@.str = private unnamed_addr constant [26 x i8] c"Element found at index %d\00", align 1
@.str.1 = private unnamed_addr constant [19 x i8] c"Element not found.\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @interpolationSearch(i32* %0, i32 %1, i32 %2, i32 %3) #0 {
  %5 = alloca i32, align 4
  %6 = alloca i32*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  store i32* %0, i32** %6, align 8
  store i32 %1, i32* %7, align 4
  store i32 %2, i32* %8, align 4
  store i32 %3, i32* %9, align 4
  %11 = load i32, i32* %7, align 4
  %12 = load i32, i32* %8, align 4
  %13 = icmp sle i32 %11, %12
  br i1 %13, label %14, label %101

14:                                               ; preds = %4
  %15 = load i32, i32* %9, align 4
  %16 = load i32*, i32** %6, align 8
  %17 = load i32, i32* %7, align 4
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds i32, i32* %16, i64 %18
  %20 = load i32, i32* %19, align 4
  %21 = icmp sge i32 %15, %20
  br i1 %21, label %22, label %101

22:                                               ; preds = %14
  %23 = load i32, i32* %9, align 4
  %24 = load i32*, i32** %6, align 8
  %25 = load i32, i32* %8, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds i32, i32* %24, i64 %26
  %28 = load i32, i32* %27, align 4
  %29 = icmp sle i32 %23, %28
  br i1 %29, label %30, label %101

30:                                               ; preds = %22
  %31 = load i32, i32* %7, align 4
  %32 = sitofp i32 %31 to double
  %33 = load i32, i32* %8, align 4
  %34 = load i32, i32* %7, align 4
  %35 = sub nsw i32 %33, %34
  %36 = sitofp i32 %35 to double
  %37 = load i32*, i32** %6, align 8
  %38 = load i32, i32* %8, align 4
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds i32, i32* %37, i64 %39
  %41 = load i32, i32* %40, align 4
  %42 = load i32*, i32** %6, align 8
  %43 = load i32, i32* %7, align 4
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds i32, i32* %42, i64 %44
  %46 = load i32, i32* %45, align 4
  %47 = sub nsw i32 %41, %46
  %48 = sitofp i32 %47 to double
  %49 = fdiv double %36, %48
  %50 = load i32, i32* %9, align 4
  %51 = load i32*, i32** %6, align 8
  %52 = load i32, i32* %7, align 4
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds i32, i32* %51, i64 %53
  %55 = load i32, i32* %54, align 4
  %56 = sub nsw i32 %50, %55
  %57 = sitofp i32 %56 to double
  %58 = fmul double %49, %57
  %59 = fadd double %32, %58
  %60 = fptosi double %59 to i32
  store i32 %60, i32* %10, align 4
  %61 = load i32*, i32** %6, align 8
  %62 = load i32, i32* %10, align 4
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds i32, i32* %61, i64 %63
  %65 = load i32, i32* %64, align 4
  %66 = load i32, i32* %9, align 4
  %67 = icmp eq i32 %65, %66
  br i1 %67, label %68, label %70

68:                                               ; preds = %30
  %69 = load i32, i32* %10, align 4
  store i32 %69, i32* %5, align 4
  br label %102

70:                                               ; preds = %30
  %71 = load i32*, i32** %6, align 8
  %72 = load i32, i32* %10, align 4
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds i32, i32* %71, i64 %73
  %75 = load i32, i32* %74, align 4
  %76 = load i32, i32* %9, align 4
  %77 = icmp slt i32 %75, %76
  br i1 %77, label %78, label %85

78:                                               ; preds = %70
  %79 = load i32*, i32** %6, align 8
  %80 = load i32, i32* %10, align 4
  %81 = add nsw i32 %80, 1
  %82 = load i32, i32* %8, align 4
  %83 = load i32, i32* %9, align 4
  %84 = call i32 @interpolationSearch(i32* %79, i32 %81, i32 %82, i32 %83)
  store i32 %84, i32* %5, align 4
  br label %102

85:                                               ; preds = %70
  %86 = load i32*, i32** %6, align 8
  %87 = load i32, i32* %10, align 4
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds i32, i32* %86, i64 %88
  %90 = load i32, i32* %89, align 4
  %91 = load i32, i32* %9, align 4
  %92 = icmp sgt i32 %90, %91
  br i1 %92, label %93, label %100

93:                                               ; preds = %85
  %94 = load i32*, i32** %6, align 8
  %95 = load i32, i32* %7, align 4
  %96 = load i32, i32* %10, align 4
  %97 = sub nsw i32 %96, 1
  %98 = load i32, i32* %9, align 4
  %99 = call i32 @interpolationSearch(i32* %94, i32 %95, i32 %97, i32 %98)
  store i32 %99, i32* %5, align 4
  br label %102

100:                                              ; preds = %85
  br label %101

101:                                              ; preds = %100, %22, %14, %4
  store i32 -1, i32* %5, align 4
  br label %102

102:                                              ; preds = %101, %93, %78, %68
  %103 = load i32, i32* %5, align 4
  ret i32 %103
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca [15 x i32], align 16
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  %6 = bitcast [15 x i32]* %2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %6, i8* align 16 bitcast ([15 x i32]* @__const.main.arr to i8*), i64 60, i1 false)
  store i32 15, i32* %3, align 4
  store i32 18, i32* %4, align 4
  %7 = getelementptr inbounds [15 x i32], [15 x i32]* %2, i64 0, i64 0
  %8 = load i32, i32* %3, align 4
  %9 = sub nsw i32 %8, 1
  %10 = load i32, i32* %4, align 4
  %11 = call i32 @interpolationSearch(i32* %7, i32 0, i32 %9, i32 %10)
  store i32 %11, i32* %5, align 4
  %12 = load i32, i32* %5, align 4
  %13 = icmp ne i32 %12, -1
  br i1 %13, label %14, label %17

14:                                               ; preds = %0
  %15 = load i32, i32* %5, align 4
  %16 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str, i64 0, i64 0), i32 %15)
  br label %19

17:                                               ; preds = %0
  %18 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.1, i64 0, i64 0))
  br label %19

19:                                               ; preds = %17, %14
  ret i32 0
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #1

declare dso_local i32 @printf(i8*, ...) #2

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 10.0.0-4ubuntu1 "}
