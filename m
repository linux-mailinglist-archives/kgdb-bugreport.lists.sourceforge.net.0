Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B678D2449FA
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 14 Aug 2020 14:50:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1k6ZAC-0006pb-I8
	for lists+kgdb-bugreport@lfdr.de; Fri, 14 Aug 2020 12:50:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1k6ZAB-0006pK-Ne
 for kgdb-bugreport@lists.sourceforge.net; Fri, 14 Aug 2020 12:50:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oNrJofI4VSIM1YMzNApXQ6u0hlAa3YOeI7FwPv0W0xo=; b=R6zRvSzXb6iqWIzBhl5TkXXELb
 xqcTJq8lWv1JSqA/CTvf8vNwoA60PPQNN5tqBBuOMILQS9jIydSBZgkYriFv4d6a8lNzL/mvWl+/P
 YEH2fyydaICCmlEHal4fFa7qxxO4d0fSJKXrDWSbkLRrVVLhVgl4mwQ+QFer3uN94v3A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oNrJofI4VSIM1YMzNApXQ6u0hlAa3YOeI7FwPv0W0xo=; b=XDhOpGxBD3xguDCYHwGR0k94mM
 Gd8aczN/wbJUtPMByuVHS6RagVag2i/42tGW8+sQnXAO0/6yqlslKBx5jWrwDMQKSXPuiBojdFdm5
 nwxheIUaUdOmd3GPZ96vqlDeWNPKThDlw+mnCH536rT6B0PNhTyLASpRv1lEscFyp05k=;
Received: from mail-lj1-f196.google.com ([209.85.208.196])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1k6ZA7-0075Tp-Hq
 for kgdb-bugreport@lists.sourceforge.net; Fri, 14 Aug 2020 12:50:27 +0000
Received: by mail-lj1-f196.google.com with SMTP id t23so9815345ljc.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 14 Aug 2020 05:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oNrJofI4VSIM1YMzNApXQ6u0hlAa3YOeI7FwPv0W0xo=;
 b=dRkTj42r1ORWNCi0KwgABypOpxNH2YfxXSplKDrbKISe72oY7nKYANmkrXI7TtKY3n
 FWkBYRoaG+R3/7Eh6gST6LtxiWqxoQ1nnN/qdQ9Knst1jUzHDduf2/YG0bhDHTtvLjkS
 DBtUfpz7eYBCI85lLB3Rw7TkYRda85x+si9K8QaSMd4wEoLUDF/zI32+bvFkkArZLn2b
 lZ0LOGC3YD0UVakzKaVLrc7hDjHoQc8aEgGCpfrRHGeL+cc/bztqeYVArmzbPYRg/pBR
 wmtPaXdqENs54CoXQf69SlfWc9fyGj+wCEIJ0Ft9yWLyfQq98qCaRGUS6iUCHvOBLvZY
 YI2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oNrJofI4VSIM1YMzNApXQ6u0hlAa3YOeI7FwPv0W0xo=;
 b=gpeRyiF2+9Nv0EUKQbizHVau1tp7uGcz7MLLtM85OpDGnzbENu3/QPAwgDFRj9n9Ds
 8+EnMEfz8xUPvA/WxXJKWRt8M6igCiBHhu40QyI6WzuC4OEpoWvI4miviHP1+xiM3Q8Q
 qD6xVM/sKFVdIksWtLVBAYv3d1h3S6UAFul6kfMIoIyu1sQ2FPqiC4e3sTTCWCW9Xdnw
 LTPz74wQ3z7P039k22gdCSz9LNJ5n0pCwPnhfwVJjKlS+UFWiSBSoNcQxZ1LUXjTiuMu
 Z5xOxD/RDEPQjEIQQ8Z8igOUEBDVl7wwSPBAZs6hV88yzeXA6fx31MnPNuYaTlKCQiDy
 dsyg==
X-Gm-Message-State: AOAM531iUIgB37Qc3ykpIG1GAMC+PFKPVUSp9vzH6l7QjnMV1gZTo+qw
 MIU5NX6yTA5fCEs9KT6V1dwUmPuevNiK+UIsFpak/Q==
X-Google-Smtp-Source: ABdhPJx+l2dECJh1QpeXm78A5+o8DyQZpif8ELQbqtHLPbnrx54NFZfHtESmhBFMjh1+R+HViwIbf0fFv25NmToqJpU=
X-Received: by 2002:a2e:b8cb:: with SMTP id s11mr1353447ljp.110.1597409416937; 
 Fri, 14 Aug 2020 05:50:16 -0700 (PDT)
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
 <CAD=FV=WGh-+GTsg3-UDr-Ht48n3sRqAJ76PJVFcFuJ1ruFEqOw@mail.gmail.com>
In-Reply-To: <CAD=FV=WGh-+GTsg3-UDr-Ht48n3sRqAJ76PJVFcFuJ1ruFEqOw@mail.gmail.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Fri, 14 Aug 2020 18:20:05 +0530
Message-ID: <CAFA6WYPOF6_+jxG+PCtUS1BHPsnzYtAHmcWRMpMnvorQQ+M3wg@mail.gmail.com>
To: Doug Anderson <dianders@chromium.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.196 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.196 listed in wl.mailspike.net]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1k6ZA7-0075Tp-Hq
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

On Thu, 13 Aug 2020 at 20:56, Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Thu, Aug 13, 2020 at 2:25 AM Sumit Garg <sumit.garg@linaro.org> wrote:
> >
> > > One other idea occurred to me that's maybe simpler.  You could in
> > > theory just poll the serial port periodically to accomplish.  It would
> > > actually probably even work to call the normal serial port interrupt
> > > routine from any random CPU.  On many serial drivers the entire
> > > interrupt handler is wrapped with:
> > >
> > > spin_lock_irqsave(&uap->port.lock, flags);
> > > ...
> > > spin_unlock_irqrestore(&uap->port.lock, flags);
> > >
> > > And a few (the ones I was involved in fixing) have the similar pattern
> > > of using uart_unlock_and_check_sysrq().
> > >
> > > Any serial drivers following this pattern could have their interrupt
> > > routine called periodically just to poll for characters and it'd be
> > > fine, right?  ...and having it take a second before a sysrq comes in
> > > this case is probably not the end of the world?
> > >
> >
> > Are you proposing to have complete RX operation in polling mode with
> > RX interrupt disabled (eg. using a kernel thread)?
>
> No, I'm suggesting a hybrid approach.  Leave the interrupts enabled as
> usual, but _also_ poll every 500 ms or 1 second (maybe make it
> configurable?).  In some serial drivers (ones that hold the lock for
> the whole interrupt routine) this polling function could actually be
> the same as the normal interrupt handler so it'd be trivially easy to
> implement and maintain.
>
> NOTE: This is not the same type of polling that kgdb does today.  The
> existing polling is really only intended to work when we're dropped
> into the debugger.  This would be more like a "poll_irq" type function
> that would do all the normal work the interrupt did and is really just
> there in the case that the CPU that the interrupt is routed to is
> locked up.
>

Your idea sounds interesting. I think where we are reaching is to have
an ever active listener to serial port that can be scheduled to any
random active CPU. And to keep its CPU overhead negligible, it can
sleep and only wake-up and listen once every 500 ms or 1 second
(configurable).

I will try to think more about it and probably give it a try with a PoC.

-Sumit

>
> > > One nice benefit of this is that it would actually work _better_ on
> > > SMP systems for any sysrqs that aren't NMI safe.  Specifically with
> > > your patch series those would be queued with irq_work_queue() which
> > > means they'd be blocked if the CPU processing the NMI is stuck with
> > > IRQs disabled.
> >
> > Yes, the sysrq handlers which aren't NMI safe will behave similarly to
> > existing IRQ based sysrq handlers.
> >
> > > With the polling mechanism they'd nicely just run on a
> > > different CPU.
> >
> > It looks like polling would cause much CPU overhead. So I am not sure
> > if that is the preferred approach.
>
> Maybe now it's clearer that there should be almost no overhead.  When
> dealing with a SYSRQ it's fine if there's a bit of a delay before it's
> processed, so polling every 1 second is probably fine.
>
> -Doug


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
