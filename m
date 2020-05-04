Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A371C3FAE
	for <lists+kgdb-bugreport@lfdr.de>; Mon,  4 May 2020 18:19:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jVdos-0008Hz-Fl
	for lists+kgdb-bugreport@lfdr.de; Mon, 04 May 2020 16:19:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1jVdor-0008Hr-5a
 for kgdb-bugreport@lists.sourceforge.net; Mon, 04 May 2020 16:19:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UMNcIlbSFVLU3Wa4ZdiVbcd/h1/cMb1IhxbYjcynbwI=; b=Cwae4j5R6aPLy2amkMIcZ/lPjp
 0+cr9rKavSYkZnGlMh/SFr2gFPKDt6O3f95r8aPAEvHHgNpC0LOaZo6I7OffaeBLGUrROdkJjp6eO
 54pESbPwIYUUV9BMq0+qpCmpXurUGpxJHbFhysAUA2jwt8BSJphmdsXww19jA6gwn9o8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UMNcIlbSFVLU3Wa4ZdiVbcd/h1/cMb1IhxbYjcynbwI=; b=Rfet3zgFAAaS2adV2xyYGdH1r+
 kvaiM7O4+FoOro+aNhGjGhHsTv5P1Lp5sR7uaxm7kXqSQishazrftQILXnqXAxPXclf104ybinHms
 sly2P4YhPK15Guq1Q4VMLUvcGgvfcixKoSXo5hAmp+GeVEtgkfBNZenFeu+arym8JbVM=;
Received: from mail-wm1-f67.google.com ([209.85.128.67])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jVdok-0074q2-FM
 for kgdb-bugreport@lists.sourceforge.net; Mon, 04 May 2020 16:19:49 +0000
Received: by mail-wm1-f67.google.com with SMTP id k12so135726wmj.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 04 May 2020 09:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=UMNcIlbSFVLU3Wa4ZdiVbcd/h1/cMb1IhxbYjcynbwI=;
 b=M7/KxBZ5XzimbtUhN6RRKrjEVlCkEj4NzUOP9Kc444ElO6wJDueL/eN76CHLf8294X
 9NADHFTz9JoVaee6qN40eOAiZ+YmOx2inS4dyl7U7AsqqjLglLYTY4eOzD2c+vsAx25h
 YzEJxwrRCBMLuVQjLTLBYqP3LzCAEWNuYarVKR2h8gHZrHLA1exVW0nsY5ioTZS/oLVa
 XiP8GwhViqmttqnOAf78uUD0kgTETqerlTBPYSO5mALlho6MP6V4RAiPd3+NRmwUm/Yx
 ToYFwH7jBF2GEoWMDpckgTAJDlgPtR9Gg2YqgH3cpNLd29+669owb4ijnRwfivk/Kc/G
 NZlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=UMNcIlbSFVLU3Wa4ZdiVbcd/h1/cMb1IhxbYjcynbwI=;
 b=QA7SEbqO+FUYIjfVmEa93rb66sFIAG8Def9wCwUgejODVj321lJ9vFQ+Na/egwEG1E
 iCkHA9dzw2ghETLhWy52I7zCp6ZmSOB5C6HIPdl3Hn0nfboPh2l8cMP9UQSKn8Slil6M
 0VneavlpGWXKFavt+gvrlQdBMlIGWrHpJwxnBG7akLYdgI9hRuh89WbbuH20CsLxrH2u
 JMW/TtBTe8p1yz+75u/qD9jAlSUFp/RlHcCUBqnUBy7ppWZ3uYz8yekIW+HDLp07qfhY
 1U6z1dT2X3jfgDwvyreofUTRUmwXcBeue6zlz1zQIaAUQGnsNWUj902b0OuzBsDBAOjW
 UT0g==
X-Gm-Message-State: AGi0PuawHacj/X21eTw6dn4w9tddZqfHho+YHbv0xljNiirHvqBZ6cJo
 6FRB8Pgs0DoGeRv1cmgGSKJJOJWxic3nFw==
X-Google-Smtp-Source: APiQypLONXW6Th2YSXt1LejwYNd0se4jOgnWg3t4puqftZujkExEtw4mF7AOlVMsxoMeaiIjwkbBFA==
X-Received: by 2002:a05:600c:2c0f:: with SMTP id
 q15mr16461206wmg.185.1588603223998; 
 Mon, 04 May 2020 07:40:23 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id u188sm14313631wmg.37.2020.05.04.07.40.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2020 07:40:23 -0700 (PDT)
Date: Mon, 4 May 2020 15:40:21 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Douglas Anderson <dianders@chromium.org>
Message-ID: <20200504144021.kdr3zwvpqh2pj3cs@holly.lan>
References: <20200428211351.85055-1-dianders@chromium.org>
 <20200428141218.v3.8.I7d5eb42c6180c831d47aef1af44d0b8be3fac559@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200428141218.v3.8.I7d5eb42c6180c831d47aef1af44d0b8be3fac559@changeid>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linuxfoundation.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.67 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.128.67 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jVdok-0074q2-FM
Subject: Re: [Kgdb-bugreport] [PATCH v3 08/11] Documentation: kgdboc:
 Document new kgdboc_earlycon parameter
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
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, corbet@lwn.net,
 will@kernel.org, agross@kernel.org,
 Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, linux-serial@vger.kernel.org,
 kgdb-bugreport@lists.sourceforge.net, jslaby@suse.com, bp@alien8.de,
 tglx@linutronix.de, mingo@redhat.com, Juergen Gross <jgross@suse.com>,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 jason.wessel@windriver.com, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Tue, Apr 28, 2020 at 02:13:48PM -0700, Douglas Anderson wrote:
> The recent patch ("kgdboc: Add kgdboc_earlycon to support early kgdb
> using boot consoles") adds a new kernel command line parameter.
> Document it.
> 
> Note that the patch adding the feature does some comparing/contrasting
> of "kgdboc_earlycon" vs. the existing "ekgdboc".  See that patch for
> more details, but briefly "ekgdboc" can be used _instead_ of "kgdboc"
> and just makes "kgdboc" do its normal initialization early (only works
> if your tty driver is already ready).  The new "kgdboc_earlycon" works
> in combination with "kgdboc" and is backed by boot consoles.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
> 
> Changes in v3:
> - Added example in kgdb.rst
> - Removed unneeded sentence in kerenel-parameters doc.
> - Renamed earlycon_kgdboc to kgdboc_earlycon.
> - Suggest people use kgdboc_earlycon instead of ekgdboc.
> 
> Changes in v2: None
> 
>  .../admin-guide/kernel-parameters.txt         | 20 ++++++++++++++++
>  Documentation/dev-tools/kgdb.rst              | 24 +++++++++++++++++++
>  2 files changed, 44 insertions(+)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 7bc83f3d9bdf..3b5ae06a98aa 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -1190,6 +1190,11 @@
>  			This is designed to be used in conjunction with
>  			the boot argument: earlyprintk=vga
>  
> +			This parameter works in place of the kgdboc parameter
> +			but can only be used if the backing tty is available
> +			very early in the boot process. For early debugging
> +			via a serial port see kgdboc_earlycon instead.
> +
>  	edd=		[EDD]
>  			Format: {"off" | "on" | "skip[mbr]"}
>  
> @@ -2105,6 +2110,21 @@
>  			 kms, kbd format: kms,kbd
>  			 kms, kbd and serial format: kms,kbd,<ser_dev>[,baud]
>  
> +	kgdboc_earlycon=	[KGDB,HW]
> +			If the boot console provides the ability to read
> +			characters and can work in polling mode, you can use
> +			this parameter to tell kgdb to use it as a backend
> +			until the normal console is registered. Intended to
> +			be used together with the kgdboc parameter which
> +			specifies the normal console to transition to.
> +
> +			The the name of the early console should be specified

s/The the/The/

Other than that:
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
