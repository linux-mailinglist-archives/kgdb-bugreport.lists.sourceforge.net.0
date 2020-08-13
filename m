Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 78AA7243C72
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 13 Aug 2020 17:27:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1k6F89-0003nB-M0
	for lists+kgdb-bugreport@lfdr.de; Thu, 13 Aug 2020 15:27:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1k6F88-0003mq-3d
 for kgdb-bugreport@lists.sourceforge.net; Thu, 13 Aug 2020 15:27:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1s5slD5xTRFFbW+h5M8Mtfy1B797ut+y2+cHY1OmjLY=; b=WLf8lvI5lApvy9g4mRaYEEl32s
 bCaRnhg31kKSnTObz6b+p+wcGnxCexRy6TbIcLul+YbxP4oWVOM+BCFLX0XQBeZSc4cit6Dj96cBX
 JvGKquX0wE3u/dYV08Xmhj5+CDfC6PPG++UB1QME7EDEyezYImC5cFRwCXBcDCjZI498=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1s5slD5xTRFFbW+h5M8Mtfy1B797ut+y2+cHY1OmjLY=; b=islBYEQjc5FLY1HOVV2HaPufCc
 qmpnBgAWV8OyjuVWqAJxvkxmhXXiernsh8eAEURuBUIoHM2lVkeszesNlD3Phymj7lBeZOwwQpxMD
 40K/o7i/fzjPs1r1dTMZTiWqAelbszpfkPjAAXp3Knl/TxS7tZ105UOA22Zwc2Pwbs/Y=;
Received: from mail-vk1-f196.google.com ([209.85.221.196])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1k6F84-00CgrN-9r
 for kgdb-bugreport@lists.sourceforge.net; Thu, 13 Aug 2020 15:27:00 +0000
Received: by mail-vk1-f196.google.com with SMTP id q72so1350140vkb.11
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 13 Aug 2020 08:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1s5slD5xTRFFbW+h5M8Mtfy1B797ut+y2+cHY1OmjLY=;
 b=WHqM+7gQMzNV59fPJeZs3rGKhbE9qM3WyS4WwK4osQC4YO4qDuGUt6LJ9FM8egQwUC
 VytnE4Zh2KYSkKeCXP4g/2ZrFQ0UTbqr49Ky7xXOH0E+VX1VQ7SHKP5HibHklBsLX0Lb
 zD8EqdHy3tjHuz3ZMqgWbofxY0x5cqC77Plqs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1s5slD5xTRFFbW+h5M8Mtfy1B797ut+y2+cHY1OmjLY=;
 b=N9d4B2v5YkGHnLg7DQ7ISqRTMjk0FiwMc/medS/KMk4UPaTemw4h/WZ/zCj07WzeYI
 8/D6I+k2M4DY7ObnvnyS523jiu+REKAitrkG3nJ6wFxKNjQoV7v7SKJuyVIGh76hm1tw
 4z9DALgeCLmWMZnCLxFVHzfZn/gjqvrlV8AuAoIpczH1bojWS4UoAOOpVtv4VXH9XKdX
 /lS37uu1EhFR54NP4tQ+otk1Lczhh8yGJWZTQjJP3sJH5UYPBz6xsvS76jkkPmXsSuVQ
 9X2xzHUKVbQBYqR0y4ylEXgm5/jHTHSfpDVAVSOKH0bgxw1hqm+9WoF7IVhEC3Pxrywb
 HImA==
X-Gm-Message-State: AOAM532MMj+509VP0FlIts8IQB3RlwQB5VQPPPY1DeVHX1FysIX1nbFH
 uJOv7vFnthUOFlfaIvzNvO1/2LGbJRo=
X-Google-Smtp-Source: ABdhPJz0Kar8996WU81BYaLRaZEYhoBUThsqBxoyavsFSbuEg4uymK1ucT5ZHhOHFzrf27gDQ6/Ygw==
X-Received: by 2002:a1f:20d8:: with SMTP id g207mr4041827vkg.31.1597332410167; 
 Thu, 13 Aug 2020 08:26:50 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com.
 [209.85.222.49])
 by smtp.gmail.com with ESMTPSA id s144sm833975vkd.25.2020.08.13.08.26.49
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Aug 2020 08:26:49 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id q68so1759404uaq.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 13 Aug 2020 08:26:49 -0700 (PDT)
X-Received: by 2002:ab0:37d3:: with SMTP id e19mr3760000uav.64.1597332408240; 
 Thu, 13 Aug 2020 08:26:48 -0700 (PDT)
MIME-Version: 1.0
References: <1595333413-30052-1-git-send-email-sumit.garg@linaro.org>
 <CAFA6WYMN=na4Pxnu1LYRVAAZRdV==5EwU-Vcq-QkRb_jaLiPmw@mail.gmail.com>
 <20200811135801.GA416071@kroah.com>
 <CAFA6WYMN8i96rEZuHLnskB+4k0o=K9vF1_we83P04h2BSoGjmQ@mail.gmail.com>
 <20200811145816.GA424033@kroah.com>
 <CAD=FV=UD=cTn6jwpYS-C-=1ORd-4azZ8ZiBR6om++2sMS1nmMg@mail.gmail.com>
 <CAFA6WYPBdOiVsKR_hSLpigN_1b9jimXKaqyRZjvKSx3xpAmLjA@mail.gmail.com>
 <CAD=FV=WccmFRkV4UUTLSYR9+7210h00Si=nG4tRs3BBuweA6ng@mail.gmail.com>
 <CAD=FV=V8UhQVQvcAp6XCmT3=6FYM=_zPELy4FTj4kMKUswaR8Q@mail.gmail.com>
 <CAFA6WYPxieH6ZTa_BFdaLuiwbqAs6r7eKmxG7ci4XtyRONGN7g@mail.gmail.com>
In-Reply-To: <CAFA6WYPxieH6ZTa_BFdaLuiwbqAs6r7eKmxG7ci4XtyRONGN7g@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 13 Aug 2020 08:26:36 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WGh-+GTsg3-UDr-Ht48n3sRqAJ76PJVFcFuJ1ruFEqOw@mail.gmail.com>
Message-ID: <CAD=FV=WGh-+GTsg3-UDr-Ht48n3sRqAJ76PJVFcFuJ1ruFEqOw@mail.gmail.com>
To: Sumit Garg <sumit.garg@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.196 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.196 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1k6F84-00CgrN-9r
Subject: Re: [Kgdb-bugreport] [RFC 0/5] Introduce NMI aware serial drivers
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 Russell King - ARM Linux admin <linux@armlinux.org.uk>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-serial@vger.kernel.org, Jiri Slaby <jslaby@suse.com>,
 kgdb-bugreport@lists.sourceforge.net,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

On Thu, Aug 13, 2020 at 2:25 AM Sumit Garg <sumit.garg@linaro.org> wrote:
>
> > One other idea occurred to me that's maybe simpler.  You could in
> > theory just poll the serial port periodically to accomplish.  It would
> > actually probably even work to call the normal serial port interrupt
> > routine from any random CPU.  On many serial drivers the entire
> > interrupt handler is wrapped with:
> >
> > spin_lock_irqsave(&uap->port.lock, flags);
> > ...
> > spin_unlock_irqrestore(&uap->port.lock, flags);
> >
> > And a few (the ones I was involved in fixing) have the similar pattern
> > of using uart_unlock_and_check_sysrq().
> >
> > Any serial drivers following this pattern could have their interrupt
> > routine called periodically just to poll for characters and it'd be
> > fine, right?  ...and having it take a second before a sysrq comes in
> > this case is probably not the end of the world?
> >
>
> Are you proposing to have complete RX operation in polling mode with
> RX interrupt disabled (eg. using a kernel thread)?

No, I'm suggesting a hybrid approach.  Leave the interrupts enabled as
usual, but _also_ poll every 500 ms or 1 second (maybe make it
configurable?).  In some serial drivers (ones that hold the lock for
the whole interrupt routine) this polling function could actually be
the same as the normal interrupt handler so it'd be trivially easy to
implement and maintain.

NOTE: This is not the same type of polling that kgdb does today.  The
existing polling is really only intended to work when we're dropped
into the debugger.  This would be more like a "poll_irq" type function
that would do all the normal work the interrupt did and is really just
there in the case that the CPU that the interrupt is routed to is
locked up.


> > One nice benefit of this is that it would actually work _better_ on
> > SMP systems for any sysrqs that aren't NMI safe.  Specifically with
> > your patch series those would be queued with irq_work_queue() which
> > means they'd be blocked if the CPU processing the NMI is stuck with
> > IRQs disabled.
>
> Yes, the sysrq handlers which aren't NMI safe will behave similarly to
> existing IRQ based sysrq handlers.
>
> > With the polling mechanism they'd nicely just run on a
> > different CPU.
>
> It looks like polling would cause much CPU overhead. So I am not sure
> if that is the preferred approach.

Maybe now it's clearer that there should be almost no overhead.  When
dealing with a SYSRQ it's fine if there's a bit of a delay before it's
processed, so polling every 1 second is probably fine.

-Doug


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
