{*<!--
/*********************************************************************************
** The contents of this file are subject to the vtiger CRM Public License Version 1.0
* ("License"); You may not use this file except in compliance with the License
* The Original Code is:  vtiger CRM Open Source
* The Initial Developer of the Original Code is vtiger.
* Portions created by vtiger are Copyright (C) vtiger.
* All Rights Reserved.
* Contributor(s): YetiForce.com
********************************************************************************/
-->*}
{strip}
    <div class="tpl-Settings-Vtiger-CustomRecordNumbering">
        <form id="EditView" method="POST">
            <div class="widget_header row">
                <div class="col-12">
                    {include file=\App\Layout::getTemplatePath('BreadCrumbs.tpl', $MODULE)}
                </div>
                <div class="col-12">
                    <span>{\App\Language::translate('LBL_CUSTOMIZE_MODENT_NUMBER_DESCRIPTION', $QUALIFIED_MODULE)}</span>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <table id="customRecordNumbering" class="table table-bordered">
                        {assign var=DEFAULT_MODULE_NAME value=$DEFAULT_MODULE_MODEL->getName()}
                        {assign var=DEFAULT_MODULE_DATA value=\App\Fields\RecordNumber::getNumber($DEFAULT_MODULE_NAME)}
                        {assign var=WIDTHTYPE value=$USER_MODEL->get('rowheight')}
                        <thead>
                        <tr>
                            <th width="30%" class="{$WIDTHTYPE}">
                                <strong>{\App\Language::translate('LBL_CUSTOMIZE_RECORD_NUMBERING', $QUALIFIED_MODULE)}</strong>
                            </th>
                            <th width="70%" class="{$WIDTHTYPE} border-left-0">
									<span class="float-right">
										<button type="button" class="btn btn-info" name="updateRecordWithSequenceNumber"><strong><span class="fas fa-exchange-alt u-mr-5px"></span>{\App\Language::translate('LBL_UPDATE_MISSING_RECORD_SEQUENCE', $QUALIFIED_MODULE)}</strong></button>
									</span>
                            </th>
                        </tr>
                        </thead>

                        <tbody>
                        <tr>
                            <td class="{$WIDTHTYPE}">
                                <label class="float-right marginRight10px"><b>{\App\Language::translate('LBL_SELECT_MODULE', $QUALIFIED_MODULE)}</b></label>
                            </td>
                            <td class="fieldValue {$WIDTHTYPE} border-left-0">
                                <select class="select2 form-control" name="sourceModule">
                                    {foreach key=index item=MODULE_MODEL from=$SUPPORTED_MODULES}
                                        {assign var=MODULE_NAME value=$MODULE_MODEL->get('name')}
                                        <option value={$MODULE_NAME} {if $MODULE_NAME eq $DEFAULT_MODULE_NAME} selected {/if}>
                                            {\App\Language::translate($MODULE_NAME, $MODULE_NAME)}
                                        </option>
                                    {/foreach}
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td class="{$WIDTHTYPE}">
                                <label class="float-right marginRight10px"><b>{\App\Language::translate('LBL_USE_PREFIX', $QUALIFIED_MODULE)}</b></label>
                            </td>
                            <td class="fieldValue {$WIDTHTYPE} border-left-0">
                                <input type="text" class="form-control" value="{$DEFAULT_MODULE_DATA['prefix']}" placeholder="{\App\Language::translate('LBL_NO_PREFIX', $QUALIFIED_MODULE)}" data-old-prefix="{$DEFAULT_MODULE_DATA['prefix']}" name="prefix" data-validation-engine="validate[funcCall[Vtiger_AlphaNumericWithSlashesCurlyBraces_Validator_Js.invokeValidation]]"/>
                            </td>
                        </tr>
                        <tr>
                            <td class="{$WITHTYPE}">
                                <label class="float-right marinRight10px"><b>{\App\Language::translate("LBL_LEADING_ZEROS", $QUALIFIED_MODULE)}</b></label>
                            </td>
                            <td class="fieldValue {$WIDTHTYPE} border-left-0">
                                <select class="select2" name="leading_zeros">
                                    <option value="0" {if empty($DEFAULT_MODULE_DATA['leading_zeros'])}selected="selected"{/if}>
                                        0 (2, 6, 88, 954, 1549)
                                    </option>
                                    <option value="1" {if $DEFAULT_MODULE_DATA['leading_zeros']===1}selected="selected"{/if}>
                                        1 (02, 06, 88, 954, 1549)
                                    </option>
                                    <option value="2" {if $DEFAULT_MODULE_DATA['leading_zeros']===2}selected="selected"{/if}>
                                        2 (002, 006, 088, 954, 1549)
                                    </option>
                                    <option value="3" {if $DEFAULT_MODULE_DATA['leading_zeros']===3}selected="selected"{/if}>
                                        3 (0002, 0006, 0088, 0954, 1549)
                                    </option>
                                    <option value="4" {if $DEFAULT_MODULE_DATA['leading_zeros']===4}selected="selected"{/if}>
                                        4 (00002, 00006, 00088, 00954, 01549)
                                    </option>
                                    <option value="5" {if $DEFAULT_MODULE_DATA['leading_zeros']===5}selected="selected"{/if}>
                                        5 (000002, 000006, 000088, 000954, 001549)
                                    </option>
                                    <option value="6" {if $DEFAULT_MODULE_DATA['leading_zeros']===6}selected="selected"{/if}>
                                        6 (0000002, 0000006, 0000088, 0000954, 0001549)
                                    </option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td class="{$WIDTHTYPE}">
                                <label class="float-right marginRight10px">
                                    <b>{\App\Language::translate('LBL_START_SEQUENCE', $QUALIFIED_MODULE)}</b><span class="redColor">*</span>
                                </label>
                            </td>
                            <td class="fieldValue {$WIDTHTYPE} border-left-0">
                                <input type="text" class="form-control" value="{$DEFAULT_MODULE_DATA['sequenceNumber']}"
                                       data-old-sequence-number="{$DEFAULT_MODULE_DATA['sequenceNumber']}" name="sequenceNumber"
                                       data-validation-engine="validate[required,funcCall[Vtiger_WholeNumber_Validator_Js.invokeValidation]]"/>
                            </td>
                        </tr>
                        <tr>
                            <td class="{$WIDTHTYPE}">
                                <label class="float-right marginRight10px">
                                    <b>{\App\Language::translate('LBL_RS_RESET_SEQUENCE', $QUALIFIED_MODULE)}</b>
                                </label>
                            </td>
                            <td class="fieldValue {$WIDTHTYPE} border-left-0">
                                <select class="select2" name="reset_sequence" data-allow-clear="true" data-placeholder="{\App\Language::translate('LBL_RS_RESET_SEQUENCE', $QUALIFIED_MODULE)}">
                                    <option></option>
                                    <option value="Y"{if $DEFAULT_MODULE_DATA['reset_sequence']==='Y'} selected {/if}>{\App\Language::translate('LBL_RS_YEAR',$QUALIFIED_MODULE)}</option>
                                    <option value="M"{if $DEFAULT_MODULE_DATA['reset_sequence']==='M'} selected {/if}>{\App\Language::translate('LBL_RS_MONTH',$QUALIFIED_MODULE)}</option>
                                    <option value="D"{if $DEFAULT_MODULE_DATA['reset_sequence']==='D'} selected {/if}>{\App\Language::translate('LBL_RS_DAY',$QUALIFIED_MODULE)}</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td class="{$WIDTHTYPE}">
                                <label class="float-right marginRight10px"><b>{\App\Language::translate('LBL_USE_POSTFIX', $QUALIFIED_MODULE)}</b></label>
                            </td>
                            <td class="fieldValue {$WIDTHTYPE} border-left-0">
                                <input type="text" class="form-control" value="{$DEFAULT_MODULE_DATA['postfix']}" placeholder="{\App\Language::translate('LBL_NO_POSTFIX', $QUALIFIED_MODULE)}" data-old-postfix="{$DEFAULT_MODULE_DATA['postfix']}" name="postfix" data-validation-engine="validate[funcCall[Vtiger_AlphaNumericWithSlashesCurlyBraces_Validator_Js.invokeValidation]]"/>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <table id="customRecordNumbering" class="table table-bordered">
                        <thead>
                        <tr>
                            <th width="30%" class="{$WIDTHTYPE}">
                                <strong>{\App\Language::translate('LBL_USE_CUSTOME_VARIABLES', $QUALIFIED_MODULE)}</strong>
                            </th>
                            <th width="70%" class="{$WIDTHTYPE} border-left-0"></th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td class="{$WIDTHTYPE}">
                                <label class="float-right marginRight10px"><b>{\App\Language::translate('LBL_CUSTOME_VARIABLES', $QUALIFIED_MODULE)}</b></label>
                            </td>
                            <td class="fieldValue {$WIDTHTYPE} border-left-0">
                                <div class="row">
                                    <div class="col-md-11">
                                        <select class="select2 form-control" id="customVariables" name="custom_variables">
                                            <option value="YYYY">{\App\Language::translate('LBL_CV_FULL_YEAR', $QUALIFIED_MODULE)}</option>
                                            <option value="YY">{\App\Language::translate('LBL_CV_YEAR', $QUALIFIED_MODULE)}</option>
                                            <option value="MM">{\App\Language::translate('LBL_CV_FULL_MONTH', $QUALIFIED_MODULE)}</option>
                                            <option value="M">{\App\Language::translate('LBL_CV_MONTH', $QUALIFIED_MODULE)}</option>
                                            <option value="DD">{\App\Language::translate('LBL_CV_FULL_DAY', $QUALIFIED_MODULE)}</option>
                                            <option value="D">{\App\Language::translate('LBL_CV_DAY', $QUALIFIED_MODULE)}</option>
                                        </select>
                                    </div>
                                    <div class="col-md-1">
                                        <input type="hidden" value="" id="customVariable"/>
                                        <button class="btn btn-sm btn-info float-right" id="customVariableCopy" title="{\App\Language::translate('LBL_COPY_CV', $QUALIFIED_MODULE)}">
                                            <span class="fas fa-copy"></span>
                                        </button>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <br/>
            <div class="row">
                <div class="col-md-12 float-right">
                    <div class="float-right">
                        <button class="btn btn-success saveButton" type="submit" disabled="disabled">
                            <strong><span class="fa fa-check u-mr-5px"></span>{\App\Language::translate('LBL_SAVE', $QUALIFIED_MODULE)}
                            </strong></button>
                        <button class="cancelLink btn btn-warning" type="reset" onclick="javascript:window.history.back();">
                            <span class="fa fa-times u-mr-5px"></span>{\App\Language::translate('LBL_CANCEL', $QUALIFIED_MODULE)}
                        </button>
                    </div>
                </div>
            </div>
        </form>
    </div>
{/strip}
