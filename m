Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 529AB224673
	for <lists+kgdb-bugreport@lfdr.de>; Sat, 18 Jul 2020 00:46:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jwZ7D-0002yS-CG
	for lists+kgdb-bugreport@lfdr.de; Fri, 17 Jul 2020 22:46:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1jwZ7B-0002xr-Jd
 for kgdb-bugreport@lists.sourceforge.net; Fri, 17 Jul 2020 22:46:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KTzkNMrSwyq0Nv+U+VjnxqvQEMur6myVfbA5cZN1NmQ=; b=BAQwfUs6EJGRf+bl3klHUerK7Y
 WIjlIGTgCoukXNRX/WgG5K1mD1eaBGx+XoyzC34bCPlcMClzDJhOMHPWPTm0ghcph/OgQ3gSrOo9N
 0gYxNNRwzoOeTY3v6McP+2yfcYEgQCQJueGBTpWtqDEnSQ7zVwtKFezvahoim8zr/hKE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KTzkNMrSwyq0Nv+U+VjnxqvQEMur6myVfbA5cZN1NmQ=; b=QHkIue1d0lShiMfE0k/2w7KgTE
 poIC/KRTwMtTvoZ6NnfJpeFFftSOchQH0EtuuUvJYH8d5mx9hVxIyyeO6SluopC2rMGEziGS7lpKf
 K1+LbveIby+OSJqLoMc6PDkRfYb/ePg4G3sovL1UcwGq9PH37C//YLM2Zp/T5YAu63ME=;
Received: from mail-pf1-f194.google.com ([209.85.210.194])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jwZ78-00Cl7P-J0
 for kgdb-bugreport@lists.sourceforge.net; Fri, 17 Jul 2020 22:46:01 +0000
Received: by mail-pf1-f194.google.com with SMTP id 207so6064162pfu.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 17 Jul 2020 15:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KTzkNMrSwyq0Nv+U+VjnxqvQEMur6myVfbA5cZN1NmQ=;
 b=anj7sbR3gHHz3pzQ2Ipg9Wh7rvglfTdQbjTjABe/EZlztDtVTkGTG4xUBw1qYq73W8
 gd2WYYGYPYOCVbDYxcee5lvkREjjWLCBiuqRm2yaTdP46zSKO3v32BIGFG5W3D1M+KTp
 wVfS9XfA29IIp0e56zQZBjftCyHvc5zJzodzU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KTzkNMrSwyq0Nv+U+VjnxqvQEMur6myVfbA5cZN1NmQ=;
 b=GsE3sBjlF3Y8lqhakEbrZWPBJcATJ3my8tX5oJp9X5q+HgQhWTQFrPN4IYFjhJ2wmx
 vV2bkUIs0Zlgfat+V0ameS2poGVv1sv8KYBsuVGLIeU+5cCeR0iG4gWxSEyEcDonq5Pw
 FWBUIQ/r2mxtkfpxj915D/WasuCXTE4yjKltOfIK8Z0vIiGaKsDOW3g/ZKfh04+ihgZW
 Ir63F1YC8uSccbL/DgY6NYVf+WojPXQFrABld+nvFgS5w3XWXdCWgI5Fu7b2PkmR3PSu
 nbAye/m5gYP/AL4PIKy6XEupkX63G2QwWXY5EpFArsH4efPq2sz3YRU/Dd7XpW4c2/kz
 n8ew==
X-Gm-Message-State: AOAM532G9uFYT/4PW6zAf/ixXCoHJmIYbqNS04vmu3x3/nueJEY2EvJu
 Z/9BMLqUYFEcucQ4fX3qntguehVmgcI=
X-Google-Smtp-Source: ABdhPJz8J4LDciqznTJ4ZWwgRHHkCSsuPfQSu9x4VrnpysrNaSUhgA1fHoSdbw5mgdC4p2oSvZRzcw==
X-Received: by 2002:a1f:a883:: with SMTP id r125mr9157588vke.29.1595025590422; 
 Fri, 17 Jul 2020 15:39:50 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com.
 [209.85.217.43])
 by smtp.gmail.com with ESMTPSA id f15sm1200189vsa.28.2020.07.17.15.39.48
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Jul 2020 15:39:50 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id p25so5648728vsg.4
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 17 Jul 2020 15:39:48 -0700 (PDT)
X-Received: by 2002:a67:ec0f:: with SMTP id d15mr8409511vso.121.1595025588164; 
 Fri, 17 Jul 2020 15:39:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200716151943.2167652-1-daniel.thompson@linaro.org>
 <20200716151943.2167652-2-daniel.thompson@linaro.org>
In-Reply-To: <20200716151943.2167652-2-daniel.thompson@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 17 Jul 2020 15:39:36 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XUxWoWr2VZJ0Ng6orxDJmEt8VRYeiFC11mT8L=NwpKig@mail.gmail.com>
Message-ID: <CAD=FV=XUxWoWr2VZJ0Ng6orxDJmEt8VRYeiFC11mT8L=NwpKig@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.194 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.194 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.5 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jwZ78-00Cl7P-J0
Subject: Re: [Kgdb-bugreport] [PATCH v2 1/3] kgdb: Honour the kprobe
 blocklist when setting breakpoints
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
Cc: Petr Mladek <pmladek@suse.com>, Peter Zijlstra <peterz@infradead.org>,
 kgdb-bugreport@lists.sourceforge.net, Patch Tracking <patches@linaro.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>, Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

On Thu, Jul 16, 2020 at 8:20 AM Daniel Thompson
<daniel.thompson@linaro.org> wrote:
>
> Currently kgdb has absolutely no safety rails in place to discourage or
> prevent a user from placing a breakpoint in dangerous places such as
> the debugger's own trap entry/exit and other places where it is not safe
> to take synchronous traps.
>
> Introduce a new config symbol KGDB_HONOUR_BLOCKLIST and modify the
> default implementation of kgdb_validate_break_address() so that we use
> the kprobe blocklist to prohibit instrumentation of critical functions
> if the config symbol is set. The config symbol dependencies are set to
> ensure that the blocklist will be enabled by default if we enable KGDB
> and are compiling for an architecture where we HAVE_KPROBES.
>
> Suggested-by: Peter Zijlstra <peterz@infradead.org>
> Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
> ---
>  include/linux/kgdb.h      | 18 ++++++++++++++++++
>  kernel/debug/debug_core.c |  4 ++++
>  kernel/debug/kdb/kdb_bp.c |  9 +++++++++
>  lib/Kconfig.kgdb          | 14 ++++++++++++++
>  4 files changed, 45 insertions(+)

Seems reasonable to me.

Reviewed-by: Douglas Anderson <dianders@chromium.org>


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
