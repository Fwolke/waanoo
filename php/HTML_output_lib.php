<?php

/*** delete btn- pre filled args on js function ***/
function deleteBtn($user_id, $event_id) {
	if(@$_SESSION['signed_in'] == true) { 
		$uid_session = $_SESSION['user_id'];
		if($user_id == $uid_session or $_SESSION['privleges'] == "admin") {
			//echo "userid: $user_id, sessionid: $uid_session";
			
			// LEFT OUT: <img src='./images/buttons/btns_content/btn_delete_inactive.png' />
			return 
				"<span id='del_$event_id' class='testBlackBtn' onClick='delEvent($event_id)'>
					<a href='#'>
						DELETE
					</a>
				</span>";
			}
		else 
			return "";
		}
	else
		return "";
	}
	

/*** edit btn for events- pre-filled args on js function***/

function editBtn($user_id, $event_id) {
	if(@$_SESSION['signed_in'] == true) { 
		$uid_session = $_SESSION['user_id'];
		if($user_id == $uid_session or $_SESSION['privleges'] == "admin") {
			// LEFT OUT: <img src='./images/buttons/btns_content/btn_edit_inactive.png' />
			return 
				"<span id='edit_$event_id' class='testBlackBtn' onClick='editEvent($event_id)'>
					<a href='#'>
						&nbsp;&nbsp; EDIT &nbsp;&nbsp;
					</a>
				</span>";
			}
		else 
			return "";
		}
	else
		return "";
	}
    
/*** Opens up a map with the pageview tracker ***/

function pageviewTrackerMap($user_id, $event_id) {
    if(@$_SESSION['signed_in'] == true) { 
		$uid_session = $_SESSION['user_id'];
		if($user_id == $uid_session or $_SESSION['privleges'] == "admin") {
            return 
				"<span id='pageview_map_$event_id' class='testBlackBtn' onClick='openPageviewMap($event_id)'>
					<a href='#'>
						Pageview Map
					</a>
				</span>";
			}
		else 
			return "";
		}
	else
		return "";
    }

/*** CHECKS IF IMAGE, IF THERE IS FIND IT AND MAKE A TAG ***/

function getEventImageSmall($event_id) {
	$cxn = $GLOBALS['cxn'];
	$sql = "SELECT * FROM event_images 
			WHERE event_id='$event_id'
			AND
			active = 1
			AND
			img_size = 1
			ORDER BY list_order DESC";
	$res = mysqli_query($cxn, $sql)
		or die("image pull failed: ".mysqli_error($cxn));
	// order by list order... so then list_order descending and only get first result
	$count = mysqli_num_rows($res);
	$row = mysqli_fetch_assoc($res);
	$url = $row['image_url'];
	
	if($count > 0) {
		return "<img class='thumbImg' src='$url' />";
		}
	else {
		return "<img class='thumbImg' style='opacity: 0.75;' src='./images/buttons/placeholder_icons/placeholder_150.png' />";
		}
	}
	

function getEventImageLarge($event_id) {
	$cxn = $GLOBALS['cxn'];
	$sql = "SELECT * FROM event_images 
			WHERE event_id='$event_id'
			AND
			active = 1
			AND
			img_size = 1
			ORDER BY list_order DESC";
	$res = mysqli_query($cxn, $sql)
		or die("image pull failed: ".mysqli_error($cxn));
	// order by list order... so then list_order descending and only get first result
	$count = mysqli_num_rows($res);
	$row = mysqli_fetch_assoc($res);
	$url = $row['image_url'];
	
	if($count > 0) {
		return "<img class='lrgImage' src='$url' />";
		}
	else {
		return "<img class='lrgImage' style='opacity: 0.75;' src='./images/buttons/placeholder_icons/placeholder_200.png' />";
		}
	}
	

/*** SHOWS CONTACT INFORMATION IF THERE IS ANY ****/	
	// maybe should like hide this by default? Make it an ajax call to go and get this info???
function contactInfoOrganizer($contactInfo, $contactType, $isContactInfo) {
	if($isContactInfo == 1) {
		if($contactType == "email") {
			return "<span class='contactDetails' ><b>email at:</b> ".strip_tags($contactInfo)."</span>";
			}
		if($contactType == "phone") {
			return "<span class='contactDetails' ><b>call at:</b> ".strip_tags($contactInfo)."</span>";
			}
		}
	else 
		return "";
	}


/*** SHOWS A BUTTON THAT CALLS JS FUNCTION WITH PRE-FILLED ARGS ***/

function attendBtn($user_id, $event_id) {
	if(@$_SESSION['signed_in'] == true) {
		$cxn = $GLOBALS['cxn'];
		$user_id = $_SESSION['user_id'];
		$sql = "SELECT * FROM attendees 
				WHERE (user_id = '$user_id' 
				AND
				event_id = '$event_id')";
		$qry = mysqli_query($cxn, $sql)
			or die("failed to select ftom attendees table");
		$count = mysqli_num_rows($qry);
		if($count == 0) {
			return "
				<span  onClick='attendingEvent($event_id)'>
					<a href='#'>
					<img class='attendImg' id='attendingBtn_$event_id' src='images/buttons/btns_content/btn_attend_inactive.png' />
					</a>
				</span>
				<span id='attendingLoader_$event_id' style='display:none'>
					<img src='images/ajax-loader-transp-arrows.gif' />
				</span>";
			}
		else {
			return "
				<span id='attendingBtn_$event_id' onClick='attendingEvent($event_id)'>
					<a href='#'>
					<img class='attendImg' src='images/buttons/btns_content/btn_attend_active.png' />
					</a>
				</span>
				<span id='attendingLoader_$event_id' style='display:none'>
					<img  src='images/ajax-loader-transp-arrows.gif' />
				</span>";
			}
		}
	else {    //NOT SIGNED IN
		return "
			<span id='attendingBtn_$event_id' onClick='attendingEvent($event_id)'>
				<a href='#'>
				<img class='attendImg' src='images/buttons/btns_content/btn_attend_inactive.png' />
				</a>
			</span>
			<span id='attendingLoader_$event_id' style='display:none'>
				<img src='images/ajax-loader-transp-arrows.gif' />
			</span>";
		}
	}
	
/*** calcs number of people that click "attending" btn ***/

function getNumAttend($event_id) {
	$cxn = $GLOBALS['cxn'];
	$sql = "SELECT * FROM attendees
			WHERE event_id = '$event_id'
			";
	$res = mysqli_query($cxn, $sql)
		or die("error getting the attendees");
	$row_count = mysqli_num_rows($res);
	return $row_count;
	}
	
/*** event field shortner ***/

function eventFieldShortner($eventField, $len) {
	if(strlen($eventField) > $len)
		return substr($eventField, 0, $len)." ... ";
	else 
		return $eventField;
	}
	
	
/*** the main output for user created events ***/	
	
function search_output_func_users($all_vars){
	extract($all_vars);
	/*
	echo "<pre>";
	print_r($all_vars);
	echo "</pre>";
	*/

	$day = format_date($start_date);
	$hour = format_time($start_date);
	//$addy = get_address($event_id);
	$del_btn = deleteBtn($user_id, $event_id);
	$edit_btn = editBtn($user_id, $event_id);
	$attend_btn = attendBtn($user_id, $event_id);
	$count_attend = getNumAttend($event_id);
	$event_img = getEventImageSmall($event_id);
	$contact_info_div = contactInfoOrganizer($contactInfo, $contactType, $isContactInfo);
	
	$event_description = eventFieldShortner($event_description, 75);
	$event_title = eventFieldShortner($event_title, 40);
	
	$search_output .= "
	<div class='eventSingle' id='event_num_$event_id'>
		
		<div class='eventImgContainer'>
			$event_img
		</div>
		
		<a href='#' >
		<div class='eventInfoContainer' onClick='eventSingleViewer($event_id)'>
			<div class='space'>
				<span class='eventTitle'><b>"
				.strip_tags($event_title)." 
				</b></span><br />
				
				<b>Date: </b>".strip_tags($day)."
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					| 
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<b>Time: </b> ".strip_tags($hour)."
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					| 
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<b>Distance: </b>".round($distance, 1)." miles. 
				 
			</div>	
						
			<b>Description: </b>".strip_tags($event_description)."<br />	
			
            <!-- HOLD OFF ON THIS: -->
			<!--
				<b>Distance: </b>".round($distance, 1)." miles. <br />
				<b>Location: </b>".strip_tags($venue_address)."
				$contact_info_div <br />
            -->
	    </div>        
        </a>
        
        <!-- NOPE
        <div class='eventEditBtnContainer'>
			<br />
			$del_btn
			<br />
			$edit_btn
			<br />
        </div> 
			-->
           
        <div class='eventBtnContainer'>
			<span onClick='openEventMap($lat, $lon, \"".strip_tags($venue_address)."\", \"".strip_tags($event_title)."\")'>
			<a href='#event_num_$event_id'>
				<img class='btnShowMap' src='images/buttons/btns_content/btn_map_inactive.png'/>
				</a>
			</span>
			
			<br />
			$attend_btn
			<br />
			<small>RSVP'd:</small> 
				<span id='att_count_$event_id'>
					$count_attend
				</span>
        </div>
            
	</div>
	";
	return $search_output;
	}




function singleEventOutput($all_vars) {
	extract($all_vars);
	
	$day = format_date($start_date);
	$hour = format_time($start_date);
	$del_btn = deleteBtn($user_id, $event_id);
	$edit_btn = editBtn($user_id, $event_id);
	$attend_btn = attendBtn($user_id, $event_id);
	$count_attend = getNumAttend($event_id);
	$event_image = getEventImageLarge($event_id);
	$contact_info_div = contactInfoOrganizer($contactInfo, $contactType, $isContactInfo);
    $pageviewMapBtn = pageviewTrackerMap($user_id, $event_id);
	
	//$event_description = eventFieldShortner($event_description, 75);
	//$event_title = eventFieldShortner($event_title, 40);
	
	$eventContent = "
		<div class='singleEventImage'>
				$event_image
			</div>
		
		<div class='singleEventText'>
			
			<span class='eventTitle'><b>"
				.strip_tags($event_title)." 
				</b></span><br />
			<div class='space'>	
				<b>Date: </b>".strip_tags($day)."
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					| 
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<b>Time: </b> ".strip_tags($hour)." 
			</div>
				<b>Distance: </b>".round($distance, 1)." miles. <br />
				<b>Location: </b>".strip_tags($venue_address)." <br />
				
            $contact_info_div <br />
		</div>
		
		<div class='singleEventButtons'>
			<br />
			<!--
                $attend_btn
                -->
			<br />
			<span onClick='openEventMap($lat, $lon, \"".strip_tags($venue_address)."\", \"".strip_tags($event_title)."\")'>
				<a href='#'>
				<img class='btnShowMap' src='images/buttons/btns_content/btn_map_inactive.png'/>
				</a>
			</span>
			<br />
			<br />
			<small>RSVP'd:</small> 
				<span id='att_count_$event_id'>
					$count_attend
				</span>
			
			<br />
			<br />
			<br />
			$del_btn
			<br />
			$edit_btn
			<br />
            $pageviewMapBtn
            <br />
		</div>
		
			<br />
			<br />
			<br />
			<br />
			<br />
		<div class='singleEventDescription'>
			<b>Description: </b>".strip_tags($event_description)."<br />
		</div>	
		";
	
	return $eventContent;
	}




// ONLY FOR YQL EVENTS
function search_output_func_YQL($all_vars){
	extract($all_vars);
	
	$day = format_date($start_date);
	$hour = format_time($start_date);
	$addy = get_address_YQL($event_id);
	
	//$del_btn = deleteBtn($user_id, $event_id);
	//$edit_btn = editBtn($user_id, $event_id);

	$search_output .= "
	<div class='eventSingle'>
		<table>
		<tr>
		<td>
			<h3>".strip_tags($event_title)."</h3>
			Date: $day  Time: $hour <br>
			Country: $country_name <br>
				<b>Location:</b> $addy, $venue_state, $venue_zip
					&nbsp;&nbsp;
					<span class='attendingBtn' onClick='openEventMap($lat, $lon, \"$addy $venue_state $venue_zip\")'> 
						Show Map
					</span>
					<br>
			
			Venue Name: $venue_name <br>
			Description: ".strip_tags($event_description)."<br>	
			Distance: ".round($distance, 1)." miles <br>
			Id: $event_id <br>
		</td>	
		</tr>
		</table>
	</div>
	<br />
	";

	return $search_output;
	}


// DISTANCE CALC
function distance($lat1, $lon1, $lat2, $lon2, $unit) { 
	$theta = $lon1 - $lon2;
	$dist = sin(deg2rad($lat1)) * sin(deg2rad($lat2)) +  cos(deg2rad($lat1)) * cos(deg2rad($lat2)) * cos(deg2rad($theta));
	$dist = acos($dist);
	$dist = rad2deg($dist);
	$miles = $dist * 60 * 1.1515;
	$unit = strtoupper($unit);
	
	if ($unit == "K") {
		return ($miles * 1.609344);
		} 
	else if ($unit == "N") {
	  return ($miles * 0.8684);
		} 
	else{
		return $miles;
		}
	}


/** quick date formatter ***/ 
function format_date($in_date){
	return date("m.d.Y", strtotime($in_date));
	}
	
/*** quick time formatter for displaying times 
 * in standard american format from MySQL time ***/
function format_time($in_date){
	$hr = date("h", strtotime($in_date));
	$hr = intval($hr);
	return $hr.date(":i a", strtotime($in_date));
	}
	
?>
