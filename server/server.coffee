Meteor.publish "posts", (userid)->
	Posts.find {}

Meteor.publish "likes", (postid)->
	Likes.find post:postid

Meteor.publish "appusers", ->
	Meteor.users.find()

Meteor.methods
	# {text:'',owner:'',date:'',parent:''}
	'addPost':(options)->
		usr = Meteor.user()
		ownr = if usr.profile? then usr.profile.name else usr.emails[0].address
		post = {
			text: options.text
			owner: 
			date: new Date()
			parent: options.parent
		}
		Posts.insert post
		#console.log post, (Posts.find date: post.date).fetch()

	'removePost':(id)->
		Posts.remove _id:id
	
	'removeAllPosts':()->
		Posts.remove {}
	
	'addNames':()->
		Meteor.users.update 'tgHnK8gQ46GXRAGtv', $set: {'profile.fullname': 'Mike Tyson' }
		Meteor.users.update 'Xr9viZQzp6KbvX6b7', $set: {'profile.fullname': 'Evander Holyfield' }
	