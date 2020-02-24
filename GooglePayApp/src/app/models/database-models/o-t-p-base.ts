import { prop,propObject,propArray,required,maxLength,range  } from "@rxweb/reactive-form-validators"
import { gridColumn } from "@rxweb/grid"


export class OTPBase {

//#region oTPId Prop
        @prop()
        oTPId : any;
//#endregion oTPId Prop


//#region oTPNumber Prop
        @range({minimumNumber:1,maximumNumber:2147483647})
        @required()
        oTPNumber : number;
//#endregion oTPNumber Prop


//#region userId Prop
        @required()
        userId : any;
//#endregion userId Prop



}