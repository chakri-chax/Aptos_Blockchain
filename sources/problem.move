// module 0x42::testing {
//     // Import the debug module published at the named account address std.
//     use std::debug;

//     const ONE: u64 = 1;

//     public fun main(x: u64) {
//         let sum = x + ONE;
//         debug::print(&sum)
//     }
//     #[test]
//     fun test(){
//         main(3);
//     }
// }