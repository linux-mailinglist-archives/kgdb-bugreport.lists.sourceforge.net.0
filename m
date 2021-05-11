Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A12DA37AA08
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 11 May 2021 16:57:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1lgTox-0001vK-P5
	for lists+kgdb-bugreport@lfdr.de; Tue, 11 May 2021 14:57:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1lgTov-0001uy-N6
 for kgdb-bugreport@lists.sourceforge.net; Tue, 11 May 2021 14:57:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pF0t0rogzmJLHeUkmnXWJbGrIhNXRPLG8pBuxXREjJk=; b=JdUMdZcmHge+97Z84vsKe5+4WE
 lp75pYjqbm2MP+T+6Ua5t1s7H+l6/ETmfHmvZfbBGMe8wu/PZIVCxvtqjOfVSV21c8e+7ghVFXy7y
 +R5Orr+mFntdh8D2bCpeiGo8p0IyqHYT4Eu+ZWssHHA+5lnD/uWs590me4/LUuFuHEJ4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pF0t0rogzmJLHeUkmnXWJbGrIhNXRPLG8pBuxXREjJk=; b=BDwF363SaH/+hZfwRc173QsoBf
 WcegDMi4Kid2yIi69Bj957zfp3MlBXpusmLEDN3ccUwVSK0soYdL6G98j6fzZ2ogX6p7KIrzSEWQ/
 A3ryIxxYTeHqUi8rIZOO2ScmIad6gZbMMzsIvi+4ttRS7BGSj3yVCW8QNdVyOG0+Bj60=;
Received: from mga11.intel.com ([192.55.52.93])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lgTos-0003Xq-Ec
 for kgdb-bugreport@lists.sourceforge.net; Tue, 11 May 2021 14:57:13 +0000
IronPort-SDR: CnnZt1Q/5atSHiJxUP3ZQClPcYvR+RZVJPCVjuVfgbuSqVW08mBuv/OO87d0mraWjOqGovAsbA
 ZkGcnRvWBj8w==
X-IronPort-AV: E=McAfee;i="6200,9189,9981"; a="196365421"
X-IronPort-AV: E=Sophos;i="5.82,291,1613462400"; d="scan'208";a="196365421"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 07:57:05 -0700
IronPort-SDR: 8PQcwvpWU6Dh0UpthJR9/VCiXxCuDjTvMOh/WTQFuV/wJApSX5qc5E38iTSMC3V6n/LRYT2qN2
 dP3l2iQdzTCg==
X-IronPort-AV: E=Sophos;i="5.82,291,1613462400"; d="scan'208";a="468941442"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 07:57:00 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1lgToe-00BTUX-KM; Tue, 11 May 2021 17:56:56 +0300
Date: Tue, 11 May 2021 17:56:56 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Petr Mladek <pmladek@suse.com>
Message-ID: <YJqbONasNp9BXx9Q@smile.fi.intel.com>
References: <20210510150413.59356-1-andriy.shevchenko@linux.intel.com>
 <YJqRYNlAu0SfWpb5@alley>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YJqRYNlAu0SfWpb5@alley>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1lgTos-0003Xq-Ec
Subject: Re: [Kgdb-bugreport] [PATCH v1 1/4] lib/vsprintf: Allow to override
 date and time separator
X-BeenThere: kgdb-bugreport@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: kgdb bugs suggestions <kgdb-bugreport.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/kgdb-bugreport>, 
 <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=kgdb-bugreport>
List-Post: <mailto:kgdb-bugreport@lists.sourceforge.net>
List-Help: <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport>, 
 <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=subscribe>
Cc: Daniel Thompson <daniel.thompson@linaro.org>, linux-nilfs@vger.kernel.org,
 Mathias Nyman <mathias.nyman@intel.com>, linux-doc@vger.kernel.org,
 JC Kuo <jckuo@nvidia.com>, kgdb-bugreport@lists.sourceforge.net,
 linux-usb@vger.kernel.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Jason Wessel <jason.wessel@windriver.com>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Joe Perches <joe@perches.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Tue, May 11, 2021 at 04:14:56PM +0200, Petr Mladek wrote:
> On Mon 2021-05-10 18:04:10, Andy Shevchenko wrote:
> > ISO 8601 defines 'T' as a separator between date and time. Though,
> > some ABIs use time and date with ' ' separator instead.
> > 
> > Add a flavour to the %pt specifier to override default separator.

...

> >  	%pt[RT]			YYYY-mm-ddTHH:MM:SS
> > +	%pt[RT]s		YYYY-mm-dd HH:MM:SS
> >  	%pt[RT]d		YYYY-mm-dd
> >  	%pt[RT]t		HH:MM:SS
> > -	%pt[RT][dt][r]
> > +	%pt[RT][dt][rs]
> 
> Sigh, we do not have clear rules what [xy] means. It might be:
> 
>       + always use one of them
>       + optionally use one of them
>       + always use any of them
>       + optionally use any of them
> 
> %pt[RT][dt][rs] is a great mix:
> 
>       + R or T is required, the rest is optional
>       + 'd' or 't' can be used but both together are not supported 
>       + any variant of 'r' and 's' is supported including various ordering
> 
> Honestly, I do not know about any magic solution that might make it
> easier to understand these monster modifiers.
> 
> Well, what about using the following at least in this case:
> 
> 	%pt[RT][dt][r][s]
> 
> It might help to understand that both 'r' and 's' can be used at the
> same time.

This is the case, yes, thanks for catching it.

> An attempt to distinguishing all the possibilities might be:
> 
> 	%pt{RT}[{dt}][r][s]
> 
> where [] means that it is optional and {} means one of them must be
> chosen. But I am not sure if it really makes the life easier. Anyway,
> this would be for another patch that updates the entire printk-formats.rst.

No, this is not the case, the d and t can go in any combinations: none, d, t,
dt, or td.

> 
> >  For printing date and time as represented by::
> >  
> > @@ -528,6 +529,9 @@ in human readable format.
> >  By default year will be incremented by 1900 and month by 1.
> >  Use %pt[RT]r (raw) to suppress this behaviour.
> >  
> > +The %pt[RT]s (space) will override ISO 8601 by using ' ' instead of 'T'
> > +between date and time. It won't have any effect when date or time is omitted.

...

> > +	do {
> > +		switch (fmt[count++]) {
> > +		case 'r':
> > +			raw = true;
> > +			break;
> > +		case 's':
> > +			space = true;
> > +			break;
> > +		default:
> > +			found = false;
> > +			break;
> > +		}
> > +	} while (found);
> >  
> >  	if (have_d)
> >  		buf = date_str(buf, end, tm, raw);
> >  	if (have_d && have_t) {
> >  		/* Respect ISO 8601 */
> 
> The comment is slightly misleding now. What about something like?
> 
> 		/* 'T' by ISO 8601. */
> 
> Or maybe call the variable: iso_8601, remove the comment, and
> invert the logic:

Okay, I will think how to improve, thanks!

> 		bool iso_8601 = true;
> 
> 		case 's':
> 			iso_8601 = false;
> 			break;
> 
> 		*buf = iso_8601 ? 'T' : ' ';
> 
> >  		if (buf < end)
> > -			*buf = 'T';
> > +			*buf = space ? ' ' : 'T';
> >  		buf++;
> >  	}

-- 
With Best Regards,
Andy Shevchenko




_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
