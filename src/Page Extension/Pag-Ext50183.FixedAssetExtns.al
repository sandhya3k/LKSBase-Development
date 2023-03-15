// pageextension 50183 "FixedAssetExtns" extends "Fixed Asset G/L Journal"
// {
//     layout
//     {
//         //#122
//         modify(Description)
//         {
//             Visible = false;
//         }

//         addafter("Account No.")
//         {
//             field("Description 3"; Rec."Description 3 ")
//             {
//                 Caption = 'Description';
//                 ApplicationArea = all;
//             }
//         }
//         //#122
//     }
// }