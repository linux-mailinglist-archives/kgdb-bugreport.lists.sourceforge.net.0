Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EFAF8AD786
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 23 Apr 2024 00:49:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1rz2Tk-0001h0-AR
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 22 Apr 2024 22:49:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <justinstitt@google.com>) id 1rz2Ti-0001gs-UA
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 22 Apr 2024 22:49:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KCKJmu5bl2+zxy0B9al546VeTzaNGWidDB8dfZXwONo=; b=jz+FcfjUKBPG1y2UX65wmNwhtq
 f+W6OhcG3zWeOTPBK3vpOJQseOes0N+cyTvLC+8xfAdHS9/ePTn0VNPNYFsu214Fg5jT5/hVkfXhp
 zpy5fjseGg4NkooQikTK7KdNqH50b8hOC2Kj9RBnzsPvPGvXDgBTuMnaVkQ1FzD+50sQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KCKJmu5bl2+zxy0B9al546VeTzaNGWidDB8dfZXwONo=; b=brrxUwVNYb2Iec/tVQJ8M8Qb0/
 pth8+P827NVQHFSMkQr+deg0Vkee3+CylPwUWoTAa4VE5/W2PlvfUY74UZgJX1a9pZoDrnPBvJ81u
 myX5OvvuXmkpB/tJL8QHPAVXu50lT4J0a+eOJ4b7r1xtF7FDbH/vZK39vHPW8BBVW7j0=;
Received: from mail-io1-f44.google.com ([209.85.166.44])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rz2Th-0007xx-RY for kgdb-bugreport@lists.sourceforge.net;
 Mon, 22 Apr 2024 22:49:39 +0000
Received: by mail-io1-f44.google.com with SMTP id
 ca18e2360f4ac-7d9c2096c29so245875939f.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 22 Apr 2024 15:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1713826172; x=1714430972;
 darn=lists.sourceforge.net; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=KCKJmu5bl2+zxy0B9al546VeTzaNGWidDB8dfZXwONo=;
 b=DcZTTtbg76IAwWSN6QvStN5moFW1FSrBQ/NcQjpvOV0IOdVS6jYFrgov1yJmFhn55z
 wZWhLFdy+AtkgyyU+Oh8FWY0haVOrfN6VMyJrh9GtX2AV81of9QZtDH+FrTR67WtVQzK
 jsqaiUuqXd5NYx+/N2RWauAQFswJrXiG87vodvd9n3jEESSkI/FCmUXJwJaO1iPZBzri
 QetU9SP4MAOBFXkF31rXkjcjifVS/f4ZF0yBpGpRfVyc663crAWBlOxcZCP/y2dgZyyI
 3yA6mSigmtoroQi10W84hoTa6KJ/7IyFFArDEhOuqP60nAK90SEAwzgPV3Cx8F0PWACx
 pZIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713826172; x=1714430972;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KCKJmu5bl2+zxy0B9al546VeTzaNGWidDB8dfZXwONo=;
 b=Q8FdJ6SB+iNz5lOgXQEmyRVc/jI6SVa5CVwHDM4JvFZCPSyWwdmH8Tm/5jieK/bPiT
 rwkNDo1qwPa5aMrQ6RNksQ0vAha0Yxem5aeCTLJ1EhaH/qCc7/nNmeAVGC2z0l6ScjS+
 patlqdlLb+YueDLIitbQ0XTttx1poR0Lk6h64dGUCoC5vhDe9dNxsbRUQGmOGOu8f/46
 7q428T5vcgdfzoJvr7vqH37TDaPDrtxIW/7uA5pCtUDq2kxAKSEFik5bQHHc14Qqkr7c
 HsNNU/hvuua92udgekWy50RuaIt6YcM0DFkhkmQZZoRLe1ZPw5mN6GwuaSZ9qFTPtEnz
 XDMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUicZaMZuWqzx1X++BZd7rUn+ATI15eOhHDR7FBBS+EM2gdYwxyQXFA0LZT8zJmldEiyVRU5KzSFSiqImGzSe8htowvR84uQ2fHQKlb2SgMMHEBAho=
X-Gm-Message-State: AOJu0Yxua8WtKIg3sjSI1sFoZpEBRl81dRY1IiY0uI4w4kKRQfwjav3l
 MpthNIr0wYKni5rdqjVT0KYcP+6SRwkBJmoaMfCMntOR67Pm508cDJjww9HuPiCv+v6mMIlpEFP
 Khg==
X-Google-Smtp-Source: AGHT+IGD8E3UcrR5oTnyvVhpyX1RzPfTUHBhXeNY2iPixwVxtpyiWDPRP4/gkHWCWW3HKlkRlz40SA==
X-Received: by 2002:a5e:d718:0:b0:7de:49c:9d3e with SMTP id
 v24-20020a5ed718000000b007de049c9d3emr793297iom.21.1713826172599; 
 Mon, 22 Apr 2024 15:49:32 -0700 (PDT)
Received: from google.com (195.121.66.34.bc.googleusercontent.com.
 [34.66.121.195]) by smtp.gmail.com with ESMTPSA id
 u16-20020a056638305000b004830b70971asm3266609jak.122.2024.04.22.15.49.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Apr 2024 15:49:32 -0700 (PDT)
Date: Mon, 22 Apr 2024 22:49:29 +0000
To: Daniel Thompson <daniel.thompson@linaro.org>
Message-ID: <kvmf4hcnoeuogggx5jmcqjch32shyswjv5cqvg4hwdg4g27rup@t4ddszao3354>
References: <20240422-kgdb_read_refactor-v2-0-ed51f7d145fe@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240422-kgdb_read_refactor-v2-0-ed51f7d145fe@linaro.org>
X-Spam-Score: -15.7 (---------------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, On Mon, Apr 22, 2024 at 05:35:53PM +0100, Daniel Thompson
 wrote: > Inspired by a patch from [Justin][1] I took a closer look at
 kdb_read().
 > > Despite Justin's patch being a (correct) one-line manipu [...] 
 Content analysis details:   (-15.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_SPF_WL     From: address is in the default SPF
 welcome-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM
 welcome-list
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.44 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.5 ENV_AND_HDR_SPF_MATCH  Env and Hdr From used in default SPF WL
 Match
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1rz2Th-0007xx-RY
Subject: Re: [Kgdb-bugreport] [PATCH v2 0/7] kdb: Refactor and fix bugs in
 kdb_read()
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
From: Justin Stitt via Kgdb-bugreport <kgdb-bugreport@lists.sourceforge.net>
Reply-To: Justin Stitt <justinstitt@google.com>
Cc: kgdb-bugreport@lists.sourceforge.net, stable@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

On Mon, Apr 22, 2024 at 05:35:53PM +0100, Daniel Thompson wrote:
> Inspired by a patch from [Justin][1] I took a closer look at kdb_read().
> 
> Despite Justin's patch being a (correct) one-line manipulation it was a
> tough patch to review because the surrounding code was hard to read and
> it looked like there were unfixed problems.
> 
> This series isn't enough to make kdb_read() beautiful but it does make
> it shorter, easier to reason about and fixes two buffer overflows and a
> screen redraw problem!
> 
> [1]: https://lore.kernel.org/all/20240403-strncpy-kernel-debug-kdb-kdb_io-c-v1-1-7f78a08e9ff4@google.com/
> 
> Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>

Seems to work nicely.

There is some weird behavior which was present before your patch and is
still present with it (let >< represent cursor position):

[0]kdb> test_ap>< (now press TAB)

[0]kdb> test_aperfmperf>< (so far so good, we got our autocomplete)

[0]kdb> test_ap><erfmperf (now, let's move the cursor back and press TAB again)

[0]kdb> test_aperfmperf><erfmperf

This is because the autocomplete engine is not considering the
characters after the cursor position. To be clear, this isn't really a
bug but rather a decision to be made about which functionality is
desired.

For example, my shell (zsh) will just simply move the cursor back to
the end of the complete match instead of re-writing stuff.

At any rate,
Tested-by: Justin Stitt <justinstitt@google.com>

> ---
> Changes in v2:
> - No code changes!
> - I belatedly realized that one of the cleanups actually fixed a buffer
>   overflow so there are changes to Cc: (to add stable@...) and to one
>   of the patch descriptions.
> - Link to v1: https://lore.kernel.org/r/20240416-kgdb_read_refactor-v1-0-b18c2d01076d@linaro.org
> 
> ---
> Daniel Thompson (7):
>       kdb: Fix buffer overflow during tab-complete
>       kdb: Use format-strings rather than '\0' injection in kdb_read()
>       kdb: Fix console handling when editing and tab-completing commands
>       kdb: Merge identical case statements in kdb_read()
>       kdb: Use format-specifiers rather than memset() for padding in kdb_read()
>       kdb: Replace double memcpy() with memmove() in kdb_read()
>       kdb: Simplify management of tmpbuffer in kdb_read()
> 
>  kernel/debug/kdb/kdb_io.c | 133 ++++++++++++++++++++--------------------------
>  1 file changed, 58 insertions(+), 75 deletions(-)
> ---
> base-commit: dccce9b8780618986962ba37c373668bcf426866
> change-id: 20240415-kgdb_read_refactor-2ea2dfc15dbb
> 
> Best regards,
> -- 
> Daniel Thompson <daniel.thompson@linaro.org>
> 

Thanks
Justin


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
