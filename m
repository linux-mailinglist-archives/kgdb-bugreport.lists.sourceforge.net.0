Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B980B27FE60
	for <lists+kgdb-bugreport@lfdr.de>; Thu,  1 Oct 2020 13:29:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kNwmO-0004jm-I0
	for lists+kgdb-bugreport@lfdr.de; Thu, 01 Oct 2020 11:29:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1kNwmH-0004hQ-Ic
 for kgdb-bugreport@lists.sourceforge.net; Thu, 01 Oct 2020 11:29:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RBzhaq1QTDsCmP+j+XwlnjdZ6fXeqGUq7x/CRDlU94o=; b=KCCclCCJuNmAAP8Q3i8v9b/mJw
 ruqGXsQOAlel3trbrzXYqpTo0bYsb35F2HpE94x6X2zMtYPTLAWYrjJ7EJZlXQw9VNSTbk2r05aKX
 jCTXI542wmnA6ABLBxQK9fuMhSDdO1ld9XFiVpCXWiMED5Y5/3REkAysQlqVLlvMHuLs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RBzhaq1QTDsCmP+j+XwlnjdZ6fXeqGUq7x/CRDlU94o=; b=eJaZSsi23RvQ079Q65rDmb+8Pf
 modfZ1w+lnGLAP2MRzyw+oAh2CLpl6trFUHx80YloDAh6yz5t1f7IdVxMnTfnGWX7A3KqxDvd2aKC
 MmeR9goUPyzNkj+6Klna2LMmUvAIaRpYPiJfHRatH7M9LZlzkLSswq4SbMIH0WZd2tL0=;
Received: from mail-wr1-f66.google.com ([209.85.221.66])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kNwm6-00Cl8x-9h
 for kgdb-bugreport@lists.sourceforge.net; Thu, 01 Oct 2020 11:29:37 +0000
Received: by mail-wr1-f66.google.com with SMTP id m6so5274312wrn.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 01 Oct 2020 04:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=RBzhaq1QTDsCmP+j+XwlnjdZ6fXeqGUq7x/CRDlU94o=;
 b=h4W+V31NRlENcALCJvo5DYM+iBJ3zPJAjFZomOeoZcDG6CxRUrImpCwGTUyUejVYHo
 3McL0OHAXeZQGwPTrh9V8r9H0HftDsfN2nClT1r0iHuKjAds2iS7cgcZt37JSOzqIFUk
 lMGjt4/yZ6uRy4H+jy4UCb9h644hne5/aJPw0PuA6NgYufjOHha1rvVU5g96svMjPxeS
 wMaV3i2jqPdXBwarXC/9g5h4bFh0rbQmbI9SuKgmtOJ3dxcEra6ZhptG08/nwrqhCCpD
 o7jDHdSctF6nw6ANP8WR5OYoQP9jfiyAcA2Avt2ii55pTgLEhKFYE/JUb3V8n3HHOhjB
 86SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RBzhaq1QTDsCmP+j+XwlnjdZ6fXeqGUq7x/CRDlU94o=;
 b=AgQbbdgH2JapPw/BqEWoUToToKjKUUS1qvVfl8Az58dfhHbfcEoPdJGaRF/igz0Kl9
 hczt8rcvS+D1ns4FFlT0tchwQgrbHpijebh6HQbbta7ZBRmzNRmc9XlZyRvHQ1NYNa2t
 FUL/Whk5aS2ZoHcMqCphLUOJEPKz2VOkY7imZQeuncDbvctiLBXH+SCZJPRtapZyyORb
 RlDGvG6ztsGnCSHThhXnqLgqHwSi2eVHqM7E4Q2cKKnroX43q/mvqUbrhlU/sBf7g7Sl
 ilU4FZNKqbbzxpHQvawxnxkaYIPL5Q3iue9GEMdu7TXC7G5deJZxTlKJD+W5CghMtQYH
 NQhA==
X-Gm-Message-State: AOAM5339KrFtu1szIadLAWK2eaLU1oPS3ToE3yysbKytUMpBn2HXRrZp
 R9dgkKFmfINFEb07OTVp7kvcX9dfM/eQ5g==
X-Google-Smtp-Source: ABdhPJxDMutN0ciYw0+6lxB3h9W30Gun+e3sEeG/4ZjLvqfEtSdB3W+BHwAmMEgp6hYKDiWzHzf6gg==
X-Received: by 2002:a5d:4247:: with SMTP id s7mr8344135wrr.167.1601551752631; 
 Thu, 01 Oct 2020 04:29:12 -0700 (PDT)
Received: from holly.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id y14sm8249720wma.48.2020.10.01.04.29.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Oct 2020 04:29:12 -0700 (PDT)
Date: Thu, 1 Oct 2020 12:29:10 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Message-ID: <20201001112910.rknvq3gswwdvhmkx@holly.lan>
References: <cover.1601467849.git.mchehab+huawei@kernel.org>
 <556f72684846c3cc30eb2f0a1e064183d4e1bdc9.1601467849.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <556f72684846c3cc30eb2f0a1e064183d4e1bdc9.1601467849.git.mchehab+huawei@kernel.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: automarkup.py]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.66 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.66 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kNwm6-00Cl8x-9h
Subject: Re: [Kgdb-bugreport] [PATCH v4 41/52] docs: kgdb.rst: fix :c:type:
 usages
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
Cc: Jonathan Corbet <corbet@lwn.net>, kgdb-bugreport@lists.sourceforge.net,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel@vger.kernel.org, Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Wed, Sep 30, 2020 at 03:25:04PM +0200, Mauro Carvalho Chehab wrote:
> Which Sphinx 3, :c:type:  can't be used anymore for structs,
> as this should be used only for typedefs.
> 
> Rely on automarkup.py for struct references.
> 
> This file has an special case, though: it uses the tag also
> to point to an array. Let's use, instead, :c:expr: for such
> purpose, as it should do the right thing.
> 
> This should fix this warning:
> 
> 	./Documentation/dev-tools/kgdb.rst:875: WARNING: Unparseable C cross-reference: 'kdb_poll_funcs[]'
> 	Invalid C declaration: Expected end of definition. [error at 14]
> 	  kdb_poll_funcs[]
> 	  --------------^
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Acked-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.


> ---
>  Documentation/dev-tools/kgdb.rst | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/dev-tools/kgdb.rst b/Documentation/dev-tools/kgdb.rst
> index c908ef4d3f04..77b688e6a254 100644
> --- a/Documentation/dev-tools/kgdb.rst
> +++ b/Documentation/dev-tools/kgdb.rst
> @@ -726,7 +726,7 @@ The kernel debugger is organized into a number of components:
>     -  contains an arch-specific trap catcher which invokes
>        kgdb_handle_exception() to start kgdb about doing its work
>  
> -   -  translation to and from gdb specific packet format to :c:type:`pt_regs`
> +   -  translation to and from gdb specific packet format to struct pt_regs
>  
>     -  Registration and unregistration of architecture specific trap
>        hooks
> @@ -846,7 +846,7 @@ invokes a callback in the serial core which in turn uses the callback in
>  the UART driver.
>  
>  When using kgdboc with a UART, the UART driver must implement two
> -callbacks in the :c:type:`struct uart_ops <uart_ops>`.
> +callbacks in the struct uart_ops.
>  Example from ``drivers/8250.c``::
>  
>  
> @@ -875,7 +875,7 @@ kernel when ``CONFIG_KDB_KEYBOARD=y`` is set in the kernel configuration.
>  The core polled keyboard driver for PS/2 type keyboards is in
>  ``drivers/char/kdb_keyboard.c``. This driver is hooked into the debug core
>  when kgdboc populates the callback in the array called
> -:c:type:`kdb_poll_funcs[]`. The kdb_get_kbd_char() is the top-level
> +:c:expr:`kdb_poll_funcs[]`. The kdb_get_kbd_char() is the top-level
>  function which polls hardware for single character input.
>  
>  kgdboc and kms
> -- 
> 2.26.2
> 


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
