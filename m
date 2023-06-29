Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA3C742ACE
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 29 Jun 2023 18:48:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1qEuom-0003CK-J8
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 29 Jun 2023 16:48:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daniel.thompson@linaro.org>) id 1qEuog-0003C3-E6
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 29 Jun 2023 16:48:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ck75qwMLAYsu4fdOQ2ZPfvL9NJwp3DUFn+wFIqZjMSI=; b=FLSsXkFW7qMtJpOQe3g6BMCwji
 ZEYmDMhleD4/Gx5OWMbFudmihcjOY1pL1NuO9eBlaLzKvh5ARpXo4JwrUTzAF9v1+Bu1wK0C2OqzY
 gk9QkuYKST2yU/WY0YL933ns3QMoQNPXnRYOFwyA+10+HDDg7SzjzH7V6WhtgXqtufxA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ck75qwMLAYsu4fdOQ2ZPfvL9NJwp3DUFn+wFIqZjMSI=; b=D61glY0W4wunA5eoxiF2/ISEyM
 nZsPE0ABwqRDKYZ6sEzJ7jOz0ZeqnaFZ4E2LFQ4xOz4bVKFXdUOsAAjLT6+8d/kr+7jeHoYbQbL7/
 qsznoajbIopMzmaXn4fe4nd1mfNeM6/aGt/BzqM+mrLKDk30kRvhUfSkJHGQkchF/E34=;
Received: from mail-wm1-f52.google.com ([209.85.128.52])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qEuoc-001DUE-6W for kgdb-bugreport@lists.sourceforge.net;
 Thu, 29 Jun 2023 16:48:22 +0000
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-3fbc1218262so5259225e9.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 29 Jun 2023 09:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688057292; x=1690649292;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Ck75qwMLAYsu4fdOQ2ZPfvL9NJwp3DUFn+wFIqZjMSI=;
 b=QrhkhV9IESwo6EVlqZZQhK0oTx73qCOiXPBadfWgs/n0icWc2PuXxL2GkF/RAYu5sX
 kTUfQv0/eGrp2cg2iGzNKqh24UD2CpW7HyCzsxmTEp4pYeW+rWEUXd9hJJ9jcR42fovN
 sqp27mLeaipdXMWQ2NiRtHuDbrRC1XV+cqNhHNC2+ot5D86uLyAXESaoBeOIt3bNKQk/
 jZrYYesikpVrajV3BU3RNN6v+SraRexHIzifmFHkTOix97RZxYNs/ANmHRHl97iToGyf
 oHv8X0UQhefjAz5g/9cGljkH6sXnVs2+W6xa+jhPFzq4aTjnK2l8wEHHaemHdGQAdLQE
 LwPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688057292; x=1690649292;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ck75qwMLAYsu4fdOQ2ZPfvL9NJwp3DUFn+wFIqZjMSI=;
 b=GYUKZn5jkUwVLIH+u5wA2Fgm9uP/EmLBDWqqzkxplYdXIJ3peZ/vq7Onvf9eJppVdd
 16H5GVTc75R6lB5SfWzdb5OUSM5QPlHruxEymQXeBkPiUyDUippn5wBfJEbKhxeHqcY0
 0bjMf+x+y0jt7C/TtRkXSuNk+q2x/fZDC0mdgth2R8g59Y1C0gQRMW6YXYkLOLBdgB25
 56O3Xi3uLfmlYII3W5Jo+Jkj8Rr13oOiegpsuqgNTXiyk3RVSn6GNPTDumRrUmBYzuP4
 rteYqgWjld0h3U8/u9huMf++//SMsm9tfzTBjX1NKCDq+CsX97qP0IrinKbuFeXmCpON
 75+Q==
X-Gm-Message-State: AC+VfDzjCZRuwCWqjt/KCgGemx9+0P3J/NBOuc3nK2EGgttnuIeZVO87
 M+EF4lX6qpATZmwq9Ycs7+iTOQ==
X-Google-Smtp-Source: ACHHUZ4+zHDq74XxcvyN8aG1Iu+IgudsPOO9+qu5vVtoc3b+/Y8ToE33xHz9Rjg/R5DSYGENZ6LAPg==
X-Received: by 2002:a1c:7c08:0:b0:3fa:9939:47c with SMTP id
 x8-20020a1c7c08000000b003fa9939047cmr9522406wmc.37.1688057291632; 
 Thu, 29 Jun 2023 09:48:11 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 y9-20020a7bcd89000000b003fbb5506e54sm3403487wmj.29.2023.06.29.09.48.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jun 2023 09:48:11 -0700 (PDT)
Date: Thu, 29 Jun 2023 17:48:09 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Douglas Anderson <dianders@chromium.org>
Message-ID: <20230629164809.GA2872423@aspen.lan>
References: <20230628125612.1.I5cc6c3d916195f5bcfdf5b75d823f2037707f5dc@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230628125612.1.I5cc6c3d916195f5bcfdf5b75d823f2037707f5dc@changeid>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Jun 28, 2023 at 12:56:17PM -0700, Douglas Anderson
 wrote: > The main kdb command parser only handles CR (ASCII 13 AKA '\r')
 today, > but not LF (ASCII 10 AKA '\n'). That means that the kdb com [...]
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.128.52 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.52 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1qEuoc-001DUE-6W
Subject: Re: [Kgdb-bugreport] [PATCH] kdb: Handle LF in the command parser
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
Cc: Petr Mladek <pmladek@suse.com>, John Ogness <john.ogness@linutronix.de>,
 kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 Aaron Tomlin <atomlin@atomlin.com>, Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Wed, Jun 28, 2023 at 12:56:17PM -0700, Douglas Anderson wrote:
> The main kdb command parser only handles CR (ASCII 13 AKA '\r') today,
> but not LF (ASCII 10 AKA '\n'). That means that the kdb command parser
> can handle terminals that send just CR or that send CR+LF but can't
> handle terminals that send just LF.
>
> The fact that kdb didn't handle LF in the command parser tripped up a
> tool I tried to use with it. Specifically, I was trying to send a
> command to my device to resume it from kdb using a ChromeOS tool like:
>   dut-control cpu_uart_cmd:"g"
> That tool only terminates lines with LF, not CR+LF.
>
> Arguably the ChromeOS tool should be fixed. After all, officially kdb
> seems to be designed such that CR+LF is the official line ending
> transmitted over the wire and that internally a line ending is just
> '\n' (LF). Some evidence:
> * uart_poll_put_char(), which is used by kdb, notices a '\n' and
>   converts it to '\r\n'.
> * kdb functions specifically use '\r' to get a carriage return without
>   a newline. You can see this in the pager where kdb will write a '\r'
>   and then write over the pager prompt.

I'd view this as simply "what you have to do drive a terminal correctly"
rather than indicating what the official newline protocol for kdb is.
With a human and a terminal emulator I would expect the typical input to
be CR-only (and that's what I setup the test suite to send ;-)).


> However, all that being said there's no real harm in accepting LF as a
> command terminator in the kdb parser and doing so seems like it would
> improve compatibility. After this, I'd expect that things would work
> OK-ish with a remote terminal that used any of CR, CR+LF, or LF as a
> line ending. Someone using CR as a line ending might get some ugliness
> where kdb wasn't able to overwrite the last line, but basic commands
> would work. Someone using just LF as a line ending would probably also
> work OK.
>
> A few other notes:
> - It can be noted that "bash" running on an "agetty" handles LF as a
>   line termination with no complaints.
> - Historically, kdb's "pager" actually handled either CR or LF fine. A
>   very quick inspection would make one think that kdb's pager actually
>   could have paged down two lines instead of one for anyone using
>   CR+LF, but this is generally avoided because of kdb_input_flush().

These are very convincing though!

> - Conceivably one could argue that some of this special case logic
>   belongs in uart_poll_get_char() since uart_poll_put_char() handles
>   the '\n' => '\r\n' conversion. I would argue that perhaps we should
>   eventually do the opposite and move the '\n' => '\r\n' out of
>   uart_poll_put_char(). Having that conversion at such a low level
>   could interfere if we ever want to transfer binary data. In
>   addition, if we truly made uart_poll_get_char() the inverse of
>   uart_poll_put_char() it would convert back to '\n' and (ironically)
>   kdb's parser currently only looks for '\r' to find the end of a
>   command.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

This arrived just as I was gathering up the patches (I know... running
late). I've added a couple of cases to the test suite to cover the
new feature.

The code looks good to me. Are you happy for me to take it this
merge cycle?


Daniel.

> ---
>
>  kernel/debug/kdb/kdb_io.c | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
>
> diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
> index 5c7e9ba7cd6b..813cb6cf72d6 100644
> --- a/kernel/debug/kdb/kdb_io.c
> +++ b/kernel/debug/kdb/kdb_io.c
> @@ -131,6 +131,7 @@ char kdb_getchar(void)
>  	int escape_delay = 0;
>  	get_char_func *f, *f_prev = NULL;
>  	int key;
> +	static bool last_char_was_cr;
>
>  	for (f = &kdb_poll_funcs[0]; ; ++f) {
>  		if (*f == NULL) {
> @@ -149,6 +150,18 @@ char kdb_getchar(void)
>  			continue;
>  		}
>
> +		/*
> +		 * The caller expects that newlines are either CR or LF. However
> +		 * some terminals send _both_ CR and LF. Avoid having to handle
> +		 * this in the caller by stripping the LF if we saw a CR right
> +		 * before.
> +		 */
> +		if (last_char_was_cr && key == '\n') {
> +			last_char_was_cr = false;
> +			continue;
> +		}
> +		last_char_was_cr = (key == '\r');
> +
>  		/*
>  		 * When the first character is received (or we get a change
>  		 * input source) we set ourselves up to handle an escape
> @@ -244,7 +257,8 @@ static char *kdb_read(char *buffer, size_t bufsize)
>  			*cp = tmp;
>  		}
>  		break;
> -	case 13: /* enter */
> +	case 10: /* linefeed */
> +	case 13: /* carriage return */
>  		*lastchar++ = '\n';
>  		*lastchar++ = '\0';
>  		if (!KDB_STATE(KGDB_TRANS)) {
> --
> 2.41.0.162.gfafddb0af9-goog
>


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
