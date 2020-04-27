Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2171BAA46
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 27 Apr 2020 18:46:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jT6tt-0004pC-EG
	for lists+kgdb-bugreport@lfdr.de; Mon, 27 Apr 2020 16:46:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1jT6ts-0004p0-UL
 for kgdb-bugreport@lists.sourceforge.net; Mon, 27 Apr 2020 16:46:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AFi2Ya3qM5IG+jnvqV1yuZyqNjUjwvEPZevqNfZVj0Y=; b=Gvj1EO2GiT+o0bGIzGr+Xihe11
 EQqsABmdRlhw4tPi45foK6tb8vUwaQ2NSxqJPs7Hq+Zahn8gbSvvmiO6ZaNBg0cIuhDbhUfoioSGV
 5c9NhvwBnJ6/IICz/TMUpTkwhRGp6paZQbKxoIDOQcGd2cD71OHjzF66Do+VNxDSmx1k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=AFi2Ya3qM5IG+jnvqV1yuZyqNjUjwvEPZevqNfZVj0Y=; b=Wf345Yao77WbPyxO/OM2+HLDdF
 oU4fPch6FQnP1lUfdETNkMmrBAEjRdyA19Z9rYyyhUQzl/VvVA8Jy5kqk66SeZNDnfvESuAflOTN6
 QgWjqlzLYN82Z0QvHu0gnrT+KzSHW0FyFHVNbYbJ6z0PiIwtBFp5RMzaCO9D+E7rzG68=;
Received: from mail-wr1-f66.google.com ([209.85.221.66])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jT6tp-00D0PG-0C
 for kgdb-bugreport@lists.sourceforge.net; Mon, 27 Apr 2020 16:46:32 +0000
Received: by mail-wr1-f66.google.com with SMTP id k1so21400987wrx.4
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 27 Apr 2020 09:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=AFi2Ya3qM5IG+jnvqV1yuZyqNjUjwvEPZevqNfZVj0Y=;
 b=h89b6fSsTBUeL/XipyElSwPh022ivI7iy5S/qxb+B/YEFMXucgbgOPMaB5I8zHmo3G
 LRWpG0yPHRoPm6hWulcNTa8EZpmSU1ehlxrUGamES39kPwX8I0j/A+0KZg7hPbEs+0ks
 HANPmqjxSzMVM627SPxh1zTvoq9vHdnqsYVlJLIsHlzUsz3AmLrZdNJaY2bMEyz4RN+E
 NUpREb4sDwp8b2vh1zjq7PTy4S4t+pYLtsg99Q5g3VduUeMbXnv7Nu100uduQeC6sixW
 KMe2/BjTYwmqPbUi0wUvp7QccKp6gT4ao065bGV2099c9BJ1ORrE1ANzXHHED1u/7sCf
 qvnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=AFi2Ya3qM5IG+jnvqV1yuZyqNjUjwvEPZevqNfZVj0Y=;
 b=HgNOF9UVR978vH/c3lSjqn9CC1MKQzLZmeQpfTxij0dbhgHdi2pg24Uea0xA1EY0TO
 DRpou45wxgR0aMCUxfnzZeiRwV9m5u0J2HdCtsnqOIOPHi6TQdHWdl2w1g8n0bX8cBrv
 XP9G4RsjbAfV6Q5PbnA35pucvmvMgedoLnPtcpoUDe6VTLC1K6o8Bqo/M9ImAW/YhcOt
 V6kyQPFhRtjwwqGAc3r3H/2mB5GwB0iGqSE8QW1M8v5WMUQKyy4CJFBVotKnuBA2RYkq
 71w7HU3MT4QXBQ71Vdane3TEIJwpeFAJXQ0jvhloqQsbBPXIPhZxeGCDScjACHqaGSlC
 hmKQ==
X-Gm-Message-State: AGi0Puadh2s3pdDRFZAjIb2eJI0nzdFW/ida9cg5mGmkqqy9ivxOQFDL
 uATFN51dr92ZmZrWO9niKUgPLQ==
X-Google-Smtp-Source: APiQypJ51FxUeaZo6yUU8t+LqTak9jj4U50akJER7m2MFUmNuUtXtokVlL35B4R3u3x89HQbdmY3Ng==
X-Received: by 2002:adf:e944:: with SMTP id m4mr27910229wrn.366.1588005982418; 
 Mon, 27 Apr 2020 09:46:22 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id x18sm21079430wrs.11.2020.04.27.09.46.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 09:46:21 -0700 (PDT)
Date: Mon, 27 Apr 2020 17:46:19 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Douglas Anderson <dianders@chromium.org>
Message-ID: <20200427164619.kw4mihmoxmxzjk66@holly.lan>
References: <20200421211447.193860-1-dianders@chromium.org>
 <20200421141234.v2.7.I7d5eb42c6180c831d47aef1af44d0b8be3fac559@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200421141234.v2.7.I7d5eb42c6180c831d47aef1af44d0b8be3fac559@changeid>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.66 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.66 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jT6tp-00D0PG-0C
Subject: Re: [Kgdb-bugreport] [PATCH v2 7/9] Documentation: kgdboc: Document
 new earlycon_kgdboc parameter
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
Cc: linux-doc@vger.kernel.org, catalin.marinas@arm.com,
 bjorn.andersson@linaro.org, hpa@zytor.com,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, will@kernel.org,
 corbet@lwn.net, agross@kernel.org,
 Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, linux-serial@vger.kernel.org,
 kgdb-bugreport@lists.sourceforge.net, Borislav Petkov <bp@suse.de>,
 jslaby@suse.com, bp@alien8.de, tglx@linutronix.de, mingo@redhat.com,
 Juergen Gross <jgross@suse.com>, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, jason.wessel@windriver.com,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Tue, Apr 21, 2020 at 02:14:45PM -0700, Douglas Anderson wrote:
> The recent patch ("kgdboc: Add earlycon_kgdboc to support early kgdb
> using boot consoles") adds a new kernel command line parameter.
> Document it.
> 
> Note that the patch adding the feature does some comparing/contrasting
> of "earlycon_kgdboc" vs. the existing "ekgdboc".  See that patch for
> more details, but briefly "ekgdboc" can be used _instead_ of "kgdboc"
> and just makes "kgdboc" do its normal initialization early (only works
> if your tty driver is already ready).  The new "earlycon_kgdboc" works
> in combination with "kgdboc" and is backed by boot consoles.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
> Changes in v2: None
> 
>  .../admin-guide/kernel-parameters.txt         | 20 +++++++++++++++++++
>  Documentation/dev-tools/kgdb.rst              | 14 +++++++++++++
>  2 files changed, 34 insertions(+)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index f2a93c8679e8..588625ec2993 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -1132,6 +1132,22 @@
>  			address must be provided, and the serial port must
>  			already be setup and configured.
>  
> +	earlycon_kgdboc=	[KGDB,HW]
> +			If the boot console provides the ability to read
> +			characters and can work in polling mode, you can use
> +			this parameter to tell kgdb to use it as a backend
> +			until the normal console is registered. Intended to
> +			be used together with the kgdboc parameter which
> +			specifies the normal console to transition to.
> +
> +			The the name of the early console should be specified
> +			as the value of this parameter. Note that the name of
> +			the early console might be different than the tty
> +			name passed to kgdboc. If only one boot console with
> +			a read() function is enabled it's OK to leave the
> +			value blank and the first boot console that implements
> +			read() will be picked.

There's no need for the "If only one boot console with a read()
funcuiton is enabled" here,

Seeing this in alphabetic order in this patch it also crosses my mind
that kgdboc_earlycon might be a better name so that is sorts closer
to the other kgdb options. This is a kgdboc feature that uses earlycon
not an earlycon feature that uses kgdboc.


> +
>  	earlyprintk=	[X86,SH,ARM,M68k,S390]
>  			earlyprintk=vga
>  			earlyprintk=sclp
> @@ -1190,6 +1206,10 @@
>  			This is designed to be used in conjunction with
>  			the boot argument: earlyprintk=vga
>  
> +			This parameter works in place of the kgdboc parameter
> +			but can only be used if the backing tty is available
> +			very early in the boot process.
> +

I wonder if pragmatic advice is more useful:

  For early debugging via a serial port see earlycon_kgdboc instead.

>  	edd=		[EDD]
>  			Format: {"off" | "on" | "skip[mbr]"}
>  
> diff --git a/Documentation/dev-tools/kgdb.rst b/Documentation/dev-tools/kgdb.rst
> index d38be58f872a..c0b321403d9a 100644
> --- a/Documentation/dev-tools/kgdb.rst
> +++ b/Documentation/dev-tools/kgdb.rst
> @@ -274,6 +274,20 @@ don't like this are to hack gdb to send the :kbd:`SysRq-G` for you as well as
>  on the initial connect, or to use a debugger proxy that allows an
>  unmodified gdb to do the debugging.
>  
> +Kernel parameter: ``earlycon_kgdboc``
> +-------------------------------------
> +
> +If you specify the kernel parameter ``earlycon_kgdboc`` and your serial
> +driver registers a boot console that supports polling (doesn't need
> +interrupts and implements a nonblocking read() function) kgdb will attempt
> +to work using the boot console until it can transition to the regular
> +tty driver specified by the ``kgdboc`` parameter.
> +
> +Normally there is only one boot console (especially that implements the
> +read() function) so just adding ``earlycon_kgdboc`` on its own is
> +sufficient to make this work.  If you have more than one boot console you
> +can add the boot console's name to differentiate.
> +

I think we need an example here. The example in the patch header for
the previous patch was useful (at least for me).


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
