// module 0x42::Narmadha{
//     use std::debug;

//     struct Person has drop{
//         age : u8
//     }

//     public fun Setting_age(_setAge:u8):u8{
//         let person1 = Person {age:_setAge};
//         let _person2 = Person {age :_setAge +1};
//           debug::print(&person1.age);
//         debug::print(&_person2.age);

//          (person1.age)
//     }

//     #[test]
//     public fun test_mod(){
//         let test_setting_age_fun = Setting_age(10);
//         debug::print(&test_setting_age_fun);
//     }
// }