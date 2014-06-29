Template.post.powner = ->
	#Meteor.call "postOwner", @_id
	@owner

Template.postcomment.powner = ->
	#Meteor.call "postOwner", @_id
	@owner