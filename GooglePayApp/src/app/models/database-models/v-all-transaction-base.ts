import { prop,propObject,propArray,required,maxLength,range  } from "@rxweb/reactive-form-validators"
import { gridColumn } from "@rxweb/grid"


export class vAllTransactionBase {

//#region gPayUserId Prop
        @gridColumn({visible: true, columnIndex:1, allowSorting: true, headerKey: 'gPayUserId', keyColumn: false})
        gPayUserId : any;
//#endregion gPayUserId Prop


//#region mobileNumber Prop
        @gridColumn({visible: true, columnIndex:9, allowSorting: true, headerKey: 'mobileNumber', keyColumn: false})
        mobileNumber : string;
//#endregion mobileNumber Prop


//#region userName Prop
        @gridColumn({visible: true, columnIndex:10, allowSorting: true, headerKey: 'userName', keyColumn: false})
        userName : string;
//#endregion userName Prop


//#region expr1 Prop
        @gridColumn({visible: true, columnIndex:4, allowSorting: true, headerKey: 'expr1', keyColumn: false})
        expr1 : any;
//#endregion expr1 Prop


//#region expr2 Prop
        @gridColumn({visible: true, columnIndex:5, allowSorting: true, headerKey: 'expr2', keyColumn: false})
        expr2 : any;
//#endregion expr2 Prop


//#region amount Prop
        @gridColumn({visible: true, columnIndex:4, allowSorting: true, headerKey: 'amount', keyColumn: false})
        amount : any;
//#endregion amount Prop


//#region reciverId Prop
        @gridColumn({visible: true, columnIndex:3, allowSorting: true, headerKey: 'reciverId', keyColumn: false})
        reciverId : any;
//#endregion reciverId Prop


//#region sendDate Prop
        @gridColumn({visible: true, columnIndex:8, allowSorting: true, headerKey: 'sendDate', keyColumn: false})
        sendDate : any;
//#endregion sendDate Prop


//#region transactionStatus Prop
        @gridColumn({visible: true, columnIndex:7, allowSorting: true, headerKey: 'transactionStatus', keyColumn: false})
        transactionStatus : any;
//#endregion transactionStatus Prop


//#region uPIId Prop
        @gridColumn({visible: true, columnIndex:10, allowSorting: true, headerKey: 'uPIId', keyColumn: false})
        uPIId : any;
//#endregion uPIId Prop


//#region remarks Prop
        @gridColumn({visible: true, columnIndex:6, allowSorting: true, headerKey: 'remarks', keyColumn: false})
        remarks : string;
//#endregion remarks Prop

}