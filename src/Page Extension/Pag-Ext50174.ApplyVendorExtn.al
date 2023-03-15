// pageextension 50174 "ApplyVendorExtn" extends "Apply Vendor Entries"
// {
//     layout
//     {
//         //#122
//         modify(Description)
//         {
//             Visible = false;
//         }

//         addafter("Vendor No.")
//         {
//             field("Description 3"; Rec."Description 3")
//             {
//                 Caption = 'Description';
//                 ApplicationArea = all;
//             }
//         }
//         //#122
//     }
// }