<% if @feedback.errors.any? %>
  // Render new review form with errors
  $('#new_feedback').html("<%= j render 'feedbacks/form', artwork: @artwork, feedback: @feedback %>");
<% else %>
  // Create a paragraph for the new review. But hide it.
  var new_feedback = $("<%= j render 'artworks/show', feedback: @feedback %>").hide();
  // Add it to the DOM, at the end of the existing reviews. It's still hidden.
  $('#feedbacks').append(new_feedback);
  // Show the new review with an animation!
  new_feedback.slideDown();
  // Reset the form
  $('#new_feedback').html("<%= j render 'feedbacks/form', artwork: @artwork, feedback: Feedback.new %>");
<% end %>
