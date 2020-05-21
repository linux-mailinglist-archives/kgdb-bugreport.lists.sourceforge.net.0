Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AEA51DD41F
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 21 May 2020 19:18:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jboq6-0003Az-3p
	for lists+kgdb-bugreport@lfdr.de; Thu, 21 May 2020 17:18:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1jboq0-00039x-OO
 for kgdb-bugreport@lists.sourceforge.net; Thu, 21 May 2020 17:18:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mpkOZJGzlOyjMi6E4aGEVw8elxqv6cvMyDakUdm0E6w=; b=LlBaFCNoIoGUau62/YQnMXq+dF
 p9Jly3rz1ORs7kvI8unGz24NM/2/c7ZvlOSg6GGO55OuODyXDgCFn6fDGbAsc/Oqd8qQIUiN0iVw+
 ho6a28EG/lrL5arPuX9wY88lhDz00UZMXphRl2VIl293NZkgPbxotQOVAkYWKGw/+BIU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mpkOZJGzlOyjMi6E4aGEVw8elxqv6cvMyDakUdm0E6w=; b=HkG6GdXcJtjdnI6wtZL1vvwd+X
 RMbGNcyFh0F5sQXJAMpPgHqWRDjWaCBgERhXNHC+xa0iiqaogszJrHQ6gMC/KkYlwsnuZH6dn3r5v
 9mUagKwUJgDyqPKGo+dT63m2BFmPmoHfMQktFb3l2vxw8t14uoXDvaZ95X62rV+U9qlE=;
Received: from mail-vs1-f68.google.com ([209.85.217.68])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jbopy-0048dk-VJ
 for kgdb-bugreport@lists.sourceforge.net; Thu, 21 May 2020 17:18:32 +0000
Received: by mail-vs1-f68.google.com with SMTP id l15so4498695vsr.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 21 May 2020 10:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mpkOZJGzlOyjMi6E4aGEVw8elxqv6cvMyDakUdm0E6w=;
 b=bFVtLzwvUKDWNkBK6dWkJEda5wjM89UHYfYNcjTYN4P+nB39oDCq/kKc6ofSZmqeHb
 tYGLDZacFX5B7LUfcjyoApF8wnLcDU72LTunks9leoZ7KG9aU5PYcikSU0WRj1soGSZ0
 o9xx2KoC3JM4VZSOcSG9U3hJuNoLmnM21QhfQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mpkOZJGzlOyjMi6E4aGEVw8elxqv6cvMyDakUdm0E6w=;
 b=AAA/UAVkOkBUVN5KFGXWPOpiIj8yjMsJIQEqFAQ6cF/eRBB3FFlfDbMgWJuu2VOr+W
 DSN64hgFyydDhbiVQjfEUclrm/o5KQmiaFjyX+B1uBDVPSGMOLdupqnXnFrqBd7ej5zJ
 ra2DI8cSLBeHkI+taf8izRPvC0hkJS29a/mn9DcdaBbTAMRAo2/dovC8Nc+q8r/+EXc+
 uHpLYQSEoje0wZXL9kQZtiKpg+optDSHKlM5kBjFH25XvSbKizyfiJZQm0S2xBuIkTlu
 lA9wX5ncD7wTnvIqNBTEL0Y9Z/21l3OFhVlsX6cdbTe5u8o/sPeDJAMAA/C3Ov427Q8v
 wzWw==
X-Gm-Message-State: AOAM5304hrdak2z5nuUL6Uu90D7apJ1UXR8woztg8AyabtJwxPQAQDzZ
 MS6iRfJU7H9qH/U2lwkAwwLzGSjOrsA=
X-Google-Smtp-Source: ABdhPJy7o9q4+HKJvMT2T3KTGPbnkNb/lQwsb2vaQ1vlMQom1+CpUPACPyBHnWIif3qjwLgWcW/Iaw==
X-Received: by 2002:a67:8eca:: with SMTP id q193mr8251837vsd.28.1590081504609; 
 Thu, 21 May 2020 10:18:24 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com.
 [209.85.222.51])
 by smtp.gmail.com with ESMTPSA id y143sm883767vky.9.2020.05.21.10.18.23
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 May 2020 10:18:23 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id f9so2843038uaq.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 21 May 2020 10:18:23 -0700 (PDT)
X-Received: by 2002:ab0:69cc:: with SMTP id u12mr7668622uaq.22.1590081503114; 
 Thu, 21 May 2020 10:18:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200429170804.880720-1-daniel.thompson@linaro.org>
 <20200430161741.1832050-1-daniel.thompson@linaro.org>
 <CAD=FV=U64XLRFkTyTi1qDZjTYQKJ9WVBf3OoULpw6yncOQURTg@mail.gmail.com>
In-Reply-To: <CAD=FV=U64XLRFkTyTi1qDZjTYQKJ9WVBf3OoULpw6yncOQURTg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 21 May 2020 10:18:10 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xut=5y-MyJSu+ERdMRkKbSf8SGMhUHg5OP=y8zA1N-xQ@mail.gmail.com>
Message-ID: <CAD=FV=Xut=5y-MyJSu+ERdMRkKbSf8SGMhUHg5OP=y8zA1N-xQ@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.217.68 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.217.68 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jbopy-0048dk-VJ
Subject: Re: [Kgdb-bugreport] [PATCH v2] serial: kgdboc: Allow earlycon
 initialization to be deferred
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
Cc: Patch Tracking <patches@linaro.org>, kgdb-bugreport@lists.sourceforge.net,
 LKML <linux-kernel@vger.kernel.org>, linux-serial@vger.kernel.org,
 Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

On Thu, Apr 30, 2020 at 9:47 AM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Thu, Apr 30, 2020 at 9:18 AM Daniel Thompson
> <daniel.thompson@linaro.org> wrote:
> >
> > Currently there is no guarantee that an earlycon will be initialized
> > before kgdboc tries to adopt it. Almost the opposite: on systems
> > with ACPI then if earlycon has no arguments then it is guaranteed that
> > earlycon will not be initialized.
> >
> > This patch mitigates the problem by giving kgdboc_earlycon a second
> > chance during console_init(). This isn't quite as good as stopping during
> > early parameter parsing but it is still early in the kernel boot.
> >
> > Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
> > ---
> >
> > Notes:
> >     v2: Simplified, more robust, runs earlier, still has Doug's
> >         recent patchset as a prerequisite. What's not to like?
> >
> >     More specifically, based on feedback from Doug Anderson, I
> >     have replaced the initial hacky implementation with a console
> >     initcall.
> >
> >     I also made it defer more aggressively after realizing that both
> >     earlycon and kgdboc_earlycon are handled as early parameters
> >     (meaning I think the current approach relies on the ordering
> >     of drivers/tty/serial/Makefile to ensure the earlycon is enabled
> >     before kgdboc tries to adopt it).
> >
> >     Finally, my apologies to Jason and kgdb ML folks, who are seeing
> >     this patch for the first time. I copied the original circulation
> >     list from a patch that wasn't kgdb related and forgot to update.
> >
> >  drivers/tty/serial/kgdboc.c | 41 +++++++++++++++++++++++++++++++++++--
> >  1 file changed, 39 insertions(+), 2 deletions(-)
>
> Thanks, this looks great!
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Are you planning to rebase this patch atop what landed?  It seems like
a useful feature.  If you want me to give a shot a rebasing, let me
know!

-Doug


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
