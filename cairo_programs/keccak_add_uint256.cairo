%builtins output range_check bitwise

from starkware.cairo.common.cairo_keccak.keccak import keccak_add_uint256
from starkware.cairo.common.uint256 import Uint256
from starkware.cairo.common.cairo_builtins import BitwiseBuiltin
from starkware.cairo.common.alloc import alloc
from starkware.cairo.common.serialize import serialize_word

func main{output_ptr : felt*, range_check_ptr, bitwise_ptr : BitwiseBuiltin*}():
    alloc_locals

    let (inputs) = alloc()
    let inputs_start = inputs

    let num = Uint256(6666666666666666666666666, 99999999999999999999999999999)

    keccak_add_uint256{inputs=inputs_start}(num=num, bigend=0)

    serialize_word(inputs[0])
    serialize_word(inputs[1])
    serialize_word(inputs[2])
    serialize_word(inputs[3])

    return ()
end
