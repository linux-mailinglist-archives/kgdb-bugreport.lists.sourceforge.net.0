Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0374C1BA4DF
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 27 Apr 2020 15:40:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jT40D-0003P5-Q3
	for lists+kgdb-bugreport@lfdr.de; Mon, 27 Apr 2020 13:40:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1jT40C-0003Ot-7u
 for kgdb-bugreport@lists.sourceforge.net; Mon, 27 Apr 2020 13:40:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+SvAEnjQGoKRVavmP97K2vdMEb3EEIWTHohY4rQOeno=; b=lOUEMr2lIb2dBg1IaCJG2iQ4nx
 SAo4/T8i//gnxvsp77aFR5rYtaT/Cg/ORPwIsUeIl7TeX9NpXDoLvl8ggHTnwux3+IefU7OH+YLD9
 ml+Uy/ouM6JtgU6dJDBE0Bfk5oEFPcPaziB4WInoifOKETfM8iegC2s0R//bfCYOt03A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+SvAEnjQGoKRVavmP97K2vdMEb3EEIWTHohY4rQOeno=; b=V9FTgNWYc+TpsbwUukKdeuq6hf
 rPE53BEhNguTOAsS3x34eyswjwum48JBy0ud7wPm+YmBt4Rw8nmTkkl9patTUEbyZ5PkenDvHnIXx
 sJZZi0UgED5nXlBrbgoyISvCKFzKVNUxZClCejLUVs4qxi+m92OlBDTBSwwI89luqzfE=;
Received: from mail-wr1-f66.google.com ([209.85.221.66])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jT408-00CqC5-5u
 for kgdb-bugreport@lists.sourceforge.net; Mon, 27 Apr 2020 13:40:52 +0000
Received: by mail-wr1-f66.google.com with SMTP id k1so20636191wrx.4
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 27 Apr 2020 06:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=+SvAEnjQGoKRVavmP97K2vdMEb3EEIWTHohY4rQOeno=;
 b=XvQ7Y9+hzU5EcfSQ86a6hv1PtqRh31M16VH/0xSAl6+mg4VcTWdI6ztirNiiq99XDR
 fT1BYBCDOFu8V8lTkW8P4YOZ8+RNhxPNDgCw7xQgRWeAXBnWWprsLFTIbPnslLv34xia
 LiSH/pEG//lcwOInyXULQDISTZEmyHdkTlSC1C3nHUpRAeWQaOFO30SbTtDvawGBlf4h
 nz3IPr3vkEFhAlImlaxwqh/zYO8X2i9Jla84ye4f1rC+KQpT7ausyxtw87dLM0Ehvmaq
 /yQm0VVw2UKpaO3xQc2pgJY7MQvjHpSXCL1zcHEC06ZZ13DBV9jfyiYANAJ7UmVAob7w
 U3HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+SvAEnjQGoKRVavmP97K2vdMEb3EEIWTHohY4rQOeno=;
 b=eRgbSpI2PifS+gZjus74mzVoL2Tg0XU4ucy/+kHkRQUOkQAtkP5QKdAWRQDnZ01qNE
 PEoRDowuVK54pCTUFdpkLq5gWD+kvJUdSvgnbHHuZLH89Lk2eHiK/uTaAUpRtZgp28Ig
 qUEy52JOx6Oy4fHGmfC6Lm+FKNUH0QjcDClBYpFRZUXVkSqV/wsvkVZgaJDMbM7dsKM7
 ymHlpK+CoauoDvbog/OZ+8OnimWyYuJzXItSIYMlCVQmXHfQ6LO8LddGyPnEKaxEr0UP
 gYWcmJ+/Zi4GIClQFEx2cWfsht/+/hw8BjoQICY3Y3EXHD73rcOy9uOJit8scyfx3HYI
 6hyQ==
X-Gm-Message-State: AGi0Pua4i5sSCUElK0/j3OHCXRTnz/qOOESuPOIwY+to8yGwfJifS8RJ
 jw9QQq4LJf6848898xhY5DIqsQ==
X-Google-Smtp-Source: APiQypKLt4Y3AQbKJxyRs7ev6STdRbv1Vx2RggZUFm2SboBwevpwPw7zspoBeZRz/dvMXUz+5GsOfQ==
X-Received: by 2002:a5d:5081:: with SMTP id a1mr29784146wrt.81.1587994841629; 
 Mon, 27 Apr 2020 06:40:41 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id h137sm88954wme.0.2020.04.27.06.40.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 06:40:40 -0700 (PDT)
Date: Mon, 27 Apr 2020 14:40:39 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Douglas Anderson <dianders@chromium.org>
Message-ID: <20200427134039.vog2eloyad55cww5@holly.lan>
References: <20200421211447.193860-1-dianders@chromium.org>
 <20200421141234.v2.1.Ied2b058357152ebcc8bf68edd6f20a11d98d7d4e@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200421141234.v2.1.Ied2b058357152ebcc8bf68edd6f20a11d98d7d4e@changeid>
X-Spam-Score: -0.3 (/)
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
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jT408-00CqC5-5u
Subject: Re: [Kgdb-bugreport] [PATCH v2 1/9] kgdb: Disable
 WARN_CONSOLE_UNLOCKED for all kgdb
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
Cc: catalin.marinas@arm.com, will@kernel.org, corbet@lwn.net,
 kgdb-bugreport@lists.sourceforge.net, hpa@zytor.com, agross@kernel.org,
 bjorn.andersson@linaro.org, jason.wessel@windriver.com, mingo@redhat.com,
 bp@alien8.de, linux-serial@vger.kernel.org, gregkh@linuxfoundation.org,
 jslaby@suse.com, tglx@linutronix.de, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Tue, Apr 21, 2020 at 02:14:39PM -0700, Douglas Anderson wrote:
> In commit 81eaadcae81b ("kgdboc: disable the console lock when in
> kgdb") we avoided the WARN_CONSOLE_UNLOCKED() yell when we were in
> kgdboc.  That still works fine, but it turns out that we get a similar
> yell when using other I/O drivers.  One example is the "I/O driver"
> for the kgdb test suite (kgdbts).  When I enabled that I again got the
> same yells.
> 
> Even though "kgdbts" doesn't actually interact with the user over the
> console, using it still causes kgdb to print to the consoles.  That
> trips the same warning:
>   con_is_visible+0x60/0x68
>   con_scroll+0x110/0x1b8
>   lf+0x4c/0xc8
>   vt_console_print+0x1b8/0x348
>   vkdb_printf+0x320/0x89c
>   kdb_printf+0x68/0x90
>   kdb_main_loop+0x190/0x860
>   kdb_stub+0x2cc/0x3ec
>   kgdb_cpu_enter+0x268/0x744
>   kgdb_handle_exception+0x1a4/0x200
>   kgdb_compiled_brk_fn+0x34/0x44
>   brk_handler+0x7c/0xb8
>   do_debug_exception+0x1b4/0x228
> 
> Let's increment/decrement the "ignore_console_lock_warning" variable
> all the time when we enter the debugger.
> 
> This will allow us to later revert commit 81eaadcae81b ("kgdboc:
> disable the console lock when in kgdb").
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
