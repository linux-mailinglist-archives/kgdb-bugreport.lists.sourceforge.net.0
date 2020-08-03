Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2F224039D
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 10 Aug 2020 10:51:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1k53X1-0002tA-61
	for lists+kgdb-bugreport@lfdr.de; Mon, 10 Aug 2020 08:51:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <allen.lkml@gmail.com>) id 1k2W7I-0002eK-Fm
 for kgdb-bugreport@lists.sourceforge.net; Mon, 03 Aug 2020 08:46:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ldpq9lUOsWhKwe/FZyOZtBINOPkrHNfkHnfcPwlRPCU=; b=i6WVBWRbBiFX77GcZUadXm4oex
 CuJ2n1V0Id9xzOkt0oJAUXTBYycGcmjO2kQK1Y9u6B39d3BLP9DJMCQgl1xZUJFNzfjAWz14O3z7b
 5ddmSs+t0UYeSiWZZgsqUgnVxpxn5iECuU7gpe7piOdWbyh9skggR/Y6K6idZe+5ktRM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ldpq9lUOsWhKwe/FZyOZtBINOPkrHNfkHnfcPwlRPCU=; b=X98bZQ2ynzcr16/7naVSlIDx1L
 hSiOzoE5U3XrV4xftoHDTmj6HYyql1eMqFkUpPVr3C6iXgIp16t3yeTSCUVusB2TVbkWaqfKdOc4k
 Q9vIn2lMJzD6rVOSSAmKNi2WKq5pfkYt/LxAAM+Bq28tD+7OKGjdXtj66tTPlKcGd7A4=;
Received: from mail-ot1-f65.google.com ([209.85.210.65])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1k2W7H-001BYu-0I
 for kgdb-bugreport@lists.sourceforge.net; Mon, 03 Aug 2020 08:46:44 +0000
Received: by mail-ot1-f65.google.com with SMTP id k12so10532938otr.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 03 Aug 2020 01:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ldpq9lUOsWhKwe/FZyOZtBINOPkrHNfkHnfcPwlRPCU=;
 b=WpMWmZ08n26KnNJ8Kee1MYAG1Jm/zPcTsurcm70Oz6QCv5oFfJJeXvq3VcoC9Bqmp3
 ZwUe+YLsT+FIs/9kGKQtxteKlRXHSSQ+XStDVRPK0FJ9rDWqULujkoduvfNvMAyy0GOg
 NoXxh8OaGSL/tRiXvcDRUH0pjdIKGIrcWXdgMqadI1W4uKjz2xIadtm/umq1TPcJ2dwv
 x921GXZ22H8R3fB7B0gACzntSyHHPZ4Uep08cGKEx1pE00WBaNIlW5skBV0VR9xSPFsw
 +/MQUrW8/mEWr+pwjxhIKc3bVJJhFwBIXZ+8+jfHudxJdG2f4k8YUNGYS662utnJkUBW
 AW1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ldpq9lUOsWhKwe/FZyOZtBINOPkrHNfkHnfcPwlRPCU=;
 b=sbQ2LeEF14BXg9rJNOo77jFeeYg0WqStwR4FfoYyLYb7oquNxQH5xAF2HuvxZovYtV
 R37y7ZLFUBCqj9y5xo086fMbkKp5tdkzbT0uDJ2Vfk+XPFw8vM0PjgvbZmSyzvIxojkc
 FNdg6bGbusReeukoXP5rcgjJNoC0lhGOdqX3REgL5+AeiU2bLwjlkn9xF6igWlOLV6Jv
 tE+zrKRLM8tqMbUPHhyYBg2OfyDG/jdh7uA+HFtmyFj83b4ILDIVbCWl9/nJXmWeBz2N
 eXyikS9OixreV3JQ5V69s6p2uSwYNZfz0/6rQJLvEtmTTOQ+vJF+9NYcxEPbWJE1AzSd
 yFtw==
X-Gm-Message-State: AOAM5315+Z0z9bF+XvttFn+Ww66X4SF/LT6XNE4ZZ6XOXY+30WPZNwGf
 gMEHQ9iR08Y8psb76g41vU9evCyUBSEue42NHT4=
X-Google-Smtp-Source: ABdhPJywEIvpuyitAoDTtD0/wC6yQxi+TGZF6FmBDXPPZy9GwNZrNEeGyjiIoXvh3WcLO7UKIwA2uajhqG5WgWac/6c=
X-Received: by 2002:a05:6830:1c65:: with SMTP id
 s5mr12486238otg.264.1596444390081; 
 Mon, 03 Aug 2020 01:46:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200716030847.1564131-1-keescook@chromium.org>
 <87h7tpa3hg.fsf@nanos.tec.linutronix.de> <202007301113.45D24C9D@keescook>
In-Reply-To: <202007301113.45D24C9D@keescook>
From: Allen <allen.lkml@gmail.com>
Date: Mon, 3 Aug 2020 14:16:15 +0530
Message-ID: <CAOMdWSJQKHAWY1P297b9koOLd8sVtezEYEyWGtymN1YeY27M6A@mail.gmail.com>
To: Kees Cook <keescook@chromium.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (allen.lkml[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.65 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.65 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1k2W7H-001BYu-0I
X-Mailman-Approved-At: Mon, 10 Aug 2020 08:51:45 +0000
Subject: Re: [Kgdb-bugreport] [PATCH 0/3] Modernize tasklet callback API
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
Cc: devel@driverdev.osuosl.org, linux-s390@vger.kernel.org,
 alsa-devel@alsa-project.org, Oscar Carter <oscar.carter@gmx.com>,
 Kernel Hardening <kernel-hardening@lists.openwall.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-input@vger.kernel.org, kgdb-bugreport@lists.sourceforge.net,
 Thomas Gleixner <tglx@linutronix.de>, Romain Perier <romain.perier@gmail.com>,
 Will Deacon <will@kernel.org>, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Kees,

>
> [heavily trimmed CC list because I think lkml is ignoring this
> thread...]
>
> On Thu, Jul 30, 2020 at 09:03:55AM +0200, Thomas Gleixner wrote:
> > Kees,
> >
> > Kees Cook <keescook@chromium.org> writes:
> > > This is the infrastructure changes to prepare the tasklet API for
> > > conversion to passing the tasklet struct as the callback argument instead
> > > of an arbitrary unsigned long. The first patch details why this is useful
> > > (it's the same rationale as the timer_struct changes from a bit ago:
> > > less abuse during memory corruption attacks, more in line with existing
> > > ways of doing things in the kernel, save a little space in struct,
> > > etc). Notably, the existing tasklet API use is much less messy, so there
> > > is less to clean up.
> > >
> > > It's not clear to me which tree this should go through... Greg since it
> > > starts with a USB clean-up, -tip for timer or interrupt, or if I should
> > > just carry it. I'm open to suggestions, but if I don't hear otherwise,
> > > I'll just carry it.
> > >
> > > My goal is to have this merged for v5.9-rc1 so that during the v5.10
> > > development cycle the new API will be available. The entire tree of
> > > changes is here[1] currently, but to split it up by maintainer the
> > > infrastructure changes need to be landed first.
> > >
> > > Review and Acks appreciated! :)
> >
> > I'd rather see tasklets vanish from the planet completely, but that's
> > going to be a daring feat. So, grudgingly:
>
> Understood! I will update the comments near the tasklet API.
>
> > Acked-by: Thomas Gleixner <tglx@linutronix.de>
>

Here's the series re-based on top of 5.8
https://github.com/allenpais/tasklets/tree/V3

Let me know how you would want these to be reviewed.

Also, I was thinking if removing tasklets completely could be a task
on KSPP wiki. If yes, I did like to take ownership of that task. I have a
couple of ideas in mind, which could be discussed in a separate email.

Thanks.

-- 
       - Allen


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
