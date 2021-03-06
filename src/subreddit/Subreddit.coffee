import Image from '../media/Image.coffee'

export default class Subreddit

	constructor: (data) ->  @[k] = v for k, v of {

		id: data.id
		name: data.display_name.toLowerCase()
		displayName: data.display_name
		language: data.lang
		tagline: data.public_description
		longDescription: data.description
		isNSFW: data.over18
		isPrivate: data.subreddit_type is 'private'
		isRestricted: data.subreddit_type is 'restricted'
		isRedditPremiumOnly: data.subreddit_type is 'gold_restricted'
		isArchived: data.subreddit_type is 'archived'
		isQuarantined: data.quarantine
		defaultCommentSort: data.suggested_comment_sort

		createDate: new Date(1000 * data.created_utc)

		mainColor: data.primary_color or ''
		secondaryColor: data.key_color or ''
		iconImage: new Image
			s: [{ u: data.community_icon or data.icon_img or '' }]
		bannerImage: new Image
			s: [{ u: data.banner_background_image or data.mobile_banner_image or data.banner_img or '' }]

		numberOfUsersBrowsing: data.accounts_active
		numberOfSubscribers: data.subscribers

	}