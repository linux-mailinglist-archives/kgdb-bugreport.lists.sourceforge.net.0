Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BEECA37A963
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 11 May 2021 16:33:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dUNa7NwQ/QVGfT/ZrcjciiCNZobUd49smkcrDNNxhHc=; b=m4wV35H8IiNl0r+FbicB/PT8+
	aTyk4eFYr9gEJTDdG27xCwyzHICcJ4pY58feK3z1RavZuhZtXKepIJGLvJfsyb940qFpbsyE08/9b
	3MjIcvmeXv/WqZlBv1CAGDKs82F+LfgdwzNdMit6aVhscIhxkyc2XqGyv2ZAgIiIZ4kfE=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1lgTSL-0000n6-U1
	for lists+kgdb-bugreport@lfdr.de; Tue, 11 May 2021 14:33:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <pmladek@suse.com>) id 1lgTSJ-0000mx-L6
 for kgdb-bugreport@lists.sourceforge.net; Tue, 11 May 2021 14:33:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=K/INbdoVMnVmSuC17hTHtZF9dvmPCdhexs0UvUqBKdU=; b=VJKDrQawNad/6maR/g6uac4NH9
 DJIpjlMO5nhTZpsJd0PABy5ud1i1XrmsR671ApBtVzgkz8j13vectq/ac0mbMctQZGq2DFhI7SsQ6
 G1vMskr/AOHzmDd5LaJbB6IbwJ9KXaUWlk9OUwTlcEhqO+0qK20TtvOz8S+Ic/s+Elmg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=K/INbdoVMnVmSuC17hTHtZF9dvmPCdhexs0UvUqBKdU=; b=MDo8Q5qZutrMO8+FH/VJCmQwGJ
 fB+dbpdwuMlMjNljqPQ/GTtlIK1sl5QlEOvzo+BzTmmQ/gl6mY3a5Uaho2yq6TulRB9bwSlK+imDE
 g2uY9a19DQnY8Kihm8K7xQoUfnYv03wcwTmcCw5B1FdNrgOzIT1JZRXstfuIaNzWXB1I=;
Received: from mx2.suse.de ([195.135.220.15])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lgTSC-0001sM-H6
 for kgdb-bugreport@lists.sourceforge.net; Tue, 11 May 2021 14:33:51 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1620742497; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=K/INbdoVMnVmSuC17hTHtZF9dvmPCdhexs0UvUqBKdU=;
 b=ZZwWnWCNMaCOX6VuJYsh6oDMSznOuCqE3OHNdSQVV9/C2i0EXmlVIOuh76zDI23pRGvYVq
 EdiYKyL07Upk0ornxhN4Gi2nyy4RC7SRHE8PQ9BMhtJqB0xiBEOX6bKgzrgn7jH38dTUrN
 WPMatuYcPOyjzG1cFGyFyLMWper17QY=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AF6FEAFE8;
 Tue, 11 May 2021 14:14:57 +0000 (UTC)
Date: Tue, 11 May 2021 16:14:56 +0200
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Message-ID: <YJqRYNlAu0SfWpb5@alley>
References: <20210510150413.59356-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210510150413.59356-1-andriy.shevchenko@linux.intel.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [195.135.220.15 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1lgTSC-0001sM-H6
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
From: Petr Mladek via Kgdb-bugreport <kgdb-bugreport@lists.sourceforge.net>
Reply-To: Petr Mladek <pmladek@suse.com>
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

On Mon 2021-05-10 18:04:10, Andy Shevchenko wrote:
> ISO 8601 defines 'T' as a separator between date and time. Though,
> some ABIs use time and date with ' ' separator instead.
> 
> Add a flavour to the %pt specifier to override default separator.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  Documentation/core-api/printk-formats.rst |  6 +++++-
>  lib/test_printf.c                         |  5 +++++
>  lib/vsprintf.c                            | 19 ++++++++++++++++---
>  3 files changed, 26 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/core-api/printk-formats.rst b/Documentation/core-api/printk-formats.rst
> index f063a384c7c8..bc85fd4685e7 100644
> --- a/Documentation/core-api/printk-formats.rst
> +++ b/Documentation/core-api/printk-formats.rst
> @@ -514,9 +514,10 @@ Time and date
>  ::
>  
>  	%pt[RT]			YYYY-mm-ddTHH:MM:SS
> +	%pt[RT]s		YYYY-mm-dd HH:MM:SS
>  	%pt[RT]d		YYYY-mm-dd
>  	%pt[RT]t		HH:MM:SS
> -	%pt[RT][dt][r]
> +	%pt[RT][dt][rs]

Sigh, we do not have clear rules what [xy] means. It might be:

      + always use one of them
      + optionally use one of them
      + always use any of them
      + optionally use any of them

%pt[RT][dt][rs] is a great mix:

      + R or T is required, the rest is optional
      + 'd' or 't' can be used but both together are not supported 
      + any variant of 'r' and 's' is supported including various ordering

Honestly, I do not know about any magic solution that might make it
easier to understand these monster modifiers.

Well, what about using the following at least in this case:

	%pt[RT][dt][r][s]

It might help to understand that both 'r' and 's' can be used at the
same time.

An attempt to distinguishing all the possibilities might be:

	%pt{RT}[{dt}][r][s]

where [] means that it is optional and {} means one of them must be
chosen. But I am not sure if it really makes the life easier. Anyway,
this would be for another patch that updates the entire printk-formats.rst.

>  
>  For printing date and time as represented by::
>  
> @@ -528,6 +529,9 @@ in human readable format.
>  By default year will be incremented by 1900 and month by 1.
>  Use %pt[RT]r (raw) to suppress this behaviour.
>  
> +The %pt[RT]s (space) will override ISO 8601 by using ' ' instead of 'T'
> +between date and time. It won't have any effect when date or time is omitted.
> +
>  Passed by reference.
>  
>  struct clk
> diff --git a/lib/vsprintf.c b/lib/vsprintf.c
> index f0c35d9b65bf..5f36c7a43cdc 100644
> --- a/lib/vsprintf.c
> +++ b/lib/vsprintf.c
> @@ -1834,7 +1834,8 @@ char *rtc_str(char *buf, char *end, const struct rtc_time *tm,
>  	      struct printf_spec spec, const char *fmt)
>  {
>  	bool have_t = true, have_d = true;
> -	bool raw = false;
> +	bool raw = false, space = false;
> +	bool found = true;
>  	int count = 2;
>  
>  	if (check_pointer(&buf, end, tm, spec))
> @@ -1851,14 +1852,26 @@ char *rtc_str(char *buf, char *end, const struct rtc_time *tm,
>  		break;
>  	}
>  
> -	raw = fmt[count] == 'r';
> +	do {
> +		switch (fmt[count++]) {
> +		case 'r':
> +			raw = true;
> +			break;
> +		case 's':
> +			space = true;
> +			break;
> +		default:
> +			found = false;
> +			break;
> +		}
> +	} while (found);
>  
>  	if (have_d)
>  		buf = date_str(buf, end, tm, raw);
>  	if (have_d && have_t) {
>  		/* Respect ISO 8601 */

The comment is slightly misleding now. What about something like?

		/* 'T' by ISO 8601. */

Or maybe call the variable: iso_8601, remove the comment, and
invert the logic:


		bool iso_8601 = true;

		case 's':
			iso_8601 = false;
			break;

		*buf = iso_8601 ? 'T' : ' ';

>  		if (buf < end)
> -			*buf = 'T';
> +			*buf = space ? ' ' : 'T';
>  		buf++;
>  	}
>  	if (have_t)

Best Regards,
Petr


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
