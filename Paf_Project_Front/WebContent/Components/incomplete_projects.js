$(document).ready(function()
{ 
if ($("#alertSuccess").text().trim() == "") 
 { 
 $("#alertSuccess").hide(); 
 } 
 $("#alertError").hide(); 
}); 
$(document).on("click", "#btnSave", function(event)
{ 
// Clear alerts---------------------
 $("#alertSuccess").text(""); 
 $("#alertSuccess").hide(); 
 $("#alertError").text(""); 
 $("#alertError").hide(); 
// Form validation-------------------
var status = validateItemForm(); 
if (status != true) 
 { 
 $("#alertError").text(status); 
 $("#alertError").show(); 
 return; 
 } 
// If valid------------------------
var type = ($("#hidItemIDSave").val() == "") ? "POST" : "PUT"; 
 $.ajax( 
 { 
 url : "InCompleteProjectAPI", 
 type : type, 
 data : $("#formItem").serialize(), 
 dataType : "text", 
 complete : function(response, status) 
 { 
 onItemSaveComplete(response.responseText, status); 
 } 
 }); 
});

function onItemSaveComplete(response, status)
{ 
if (status == "success") 
 { 
 var resultSet = JSON.parse(response); 
 if (resultSet.status.trim() == "success") 
 { 
 $("#alertSuccess").text("Successfully saved."); 
 $("#alertSuccess").show(); 
 $("#divItemsGrid").html(resultSet.data); 
 } else if (resultSet.status.trim() == "error") 
 { 
 $("#alertError").text(resultSet.data); 
 $("#alertError").show(); 
 } 
 } else if (status == "error") 
 { 
 $("#alertError").text("Error while saving."); 
 $("#alertError").show(); 
 } else
 { 
 $("#alertError").text("Unknown error while saving.."); 
 $("#alertError").show(); 
 } 
 $("#hidItemIDSave").val(""); 
 $("#formItem")[0].reset(); 
}

$(document).on("click", ".btnUpdate", function(event)
{ 
$("#hidItemIDSave").val($(this).data("itemid")); 
 $("#rid").val($(this).closest("tr").find('td:eq(0)').text()); 
 $("#proj_code").val($(this).closest("tr").find('td:eq(1)').text()); 
 $("#proj_name").val($(this).closest("tr").find('td:eq(2)').text()); 
 $("#proj_desc").val($(this).closest("tr").find('td:eq(3)').text()); 
 $("#skills_required").val($(this).closest("tr").find('td:eq(4)').text());  
 $("#estimate_fund").val($(this).closest("tr").find('td:eq(5)').text()); 
 $("#no_of_funds_made").val($(this).closest("tr").find('td:eq(6)').text());
 $("#amount_to_fund").val($(this).closest("tr").find('td:eq(7)').text());
 
});

$(document).on("click", ".btnRemove", function(event)
{ 
 $.ajax( 
 { 
 url : "InCompleteProjectAPI", 
 type : "DELETE", 
 data : "proj_id=" + $(this).data("itemid"),
 dataType : "text", 
 complete : function(response, status) 
 { 
 onItemDeleteComplete(response.responseText, status); 
 } 
 }); 
});

function onItemDeleteComplete(response, status)
{ 
if (status == "success") 
 { 
 var resultSet = JSON.parse(response); 
 if (resultSet.status.trim() == "success") 
 { 
 $("#alertSuccess").text("Successfully deleted."); 
 $("#alertSuccess").show(); 
 $("#divItemsGrid").html(resultSet.data); 
 } else if (resultSet.status.trim() == "error") 
 { 
 $("#alertError").text(resultSet.data); 
 $("#alertError").show(); 
 } 
 } else if (status == "error") 
 { 
 $("#alertError").text("Error while deleting."); 
 $("#alertError").show(); 
 } else
 { 
 $("#alertError").text("Unknown error while deleting.."); 
 $("#alertError").show(); 
 } 
}
function validateItemForm() 
{
// RID
if ($("#rid").val().trim() == "") 
{ 
 return "Insert rid."; 
} 
// CODE
if ($("#proj_code").val().trim() == "") 
 { 
 return "Insert proj Code."; 
 } 
// NAME
if ($("#proj_name").val().trim() == "") 
 { 
 return "Insert project Name."; 
 } 
// DESC-------------------------------
if ($("#proj_desc").val().trim() == "") 
 { 
 return "Insert project description."; 
 } 
//SKILLS REQUIRED-------------------------------
 if ($("#skills_required").val().trim() == "") 
  { 
  return "Insert skills required."; 
  }
//FUND-------------------------------
 if ($("#estimate_fund").val().trim() == "") 
  { 
  return "Insert project funding amount."; 
  }
//NO_OF_FUNDS_MADE-------------------------------
 if ($("#no_of_funds_made").val().trim() == "") 
  { 
  return "Insert project funding amount."; 
  }
//AMOUNT_TO_FUND-------------------------------
 if ($("#amount_to_fund").val().trim() == "") 
  { 
  return "Insert project funding amount."; 
  }
// is numerical value
var tmpPrice = $("#estimate_fund").val().trim(); 
if (!$.isNumeric(tmpPrice)) 
 { 
 return "Insert a numerical value for project fund."; 
 } 
// convert to decimal price
 $("#estimate_fund").val(parseFloat(tmpPrice).toFixed(2)); 

return true; 
}
