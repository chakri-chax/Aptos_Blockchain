// module std::vector {
  

//     /// Create an empty vector.
//     native public fun empty<Element>(): vector<Element>;

//     // ... (rest of the code remains the same)


// public fun test_empty_vector() {
//     // Create an empty vector of u64
//     let empty_u64_vector: vector<u64> = std::vector::empty<u64>();

//     // Get the length of the empty vector
//     let len = std::vector::length(&empty_u64_vector);

//     // Print the length (should be 0)
//     0x1::Debug::print_u64(len);
// }
// }