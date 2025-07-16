//===----------------------------------------------------------------------===//
//
// This file defines all of the DPU-specific intrinsics.
//
//===----------------------------------------------------------------------===//

def llvm_mram_ptr_ty : LLVMQualPointerType<255>;
def llvm_wram_ptr_ty : LLVMQualPointerType<0>;

let TargetPrefix = "dpu" in {
    def int_dpu_tid : Intrinsic<[llvm_anyint_ty], [], [IntrNoMem]>;
    def int_dpu_sdma : Intrinsic<[], [llvm_wram_ptr_ty, llvm_mram_ptr_ty, llvm_i32_ty], [IntrHasSideEffects, ReadOnly<ArgIndex<1>>, WriteOnly<ArgIndex<0>>, Throws]>;
    def int_dpu_ldma : Intrinsic<[], [llvm_wram_ptr_ty, llvm_mram_ptr_ty, llvm_i32_ty], [IntrHasSideEffects, ReadOnly<ArgIndex<1>>, WriteOnly<ArgIndex<0>>, Throws]>;
    def int_dpu_sdma_unchecked : Intrinsic<[], [llvm_wram_ptr_ty, llvm_wram_ptr_ty, llvm_i32_ty], [IntrHasSideEffects, ReadOnly<ArgIndex<0>>, WriteOnly<ArgIndex<1>>, Throws]>;
    def int_dpu_ldma_unchecked : Intrinsic<[], [llvm_wram_ptr_ty, llvm_wram_ptr_ty, llvm_i32_ty], [IntrHasSideEffects, ReadOnly<ArgIndex<1>>, WriteOnly<ArgIndex<0>>, Throws]>;
}