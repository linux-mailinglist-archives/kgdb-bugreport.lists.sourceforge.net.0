Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF1220CE56
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 29 Jun 2020 13:45:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jpsDs-0001px-1p
	for lists+kgdb-bugreport@lfdr.de; Mon, 29 Jun 2020 11:45:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1jpsDp-0001pd-UH
 for kgdb-bugreport@lists.sourceforge.net; Mon, 29 Jun 2020 11:45:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XGw/iLKNRAiVkZjoBpYpVGlTMGowb6J/RzcIqE9oUnc=; b=LjzLWqewkxS2quzKZd8zXjA4QR
 YIu4lP5ey4pELIbcsGPhgHy1/PlcGEvtMU4JX+hEfCWi7XY8kI9SpVuQtjxVhHs7MPhl9xtqH5/gB
 +/iM6Mh59JpP2IJEqDps6kzEoMn17nB6eADcD+pn4G+o3xxvAjJIXNaxZ+fK1etL+q8E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XGw/iLKNRAiVkZjoBpYpVGlTMGowb6J/RzcIqE9oUnc=; b=OjXj5ISE/3+0UY/iGnxiKDg3iD
 K2n9c7b0JitzKa+Xq1JU2Rbx+BOVKD3zKMJNEdVWNtCI0vX1XQP//lE4KFbsNR5qAaZPCADHQViAr
 A0SOtB7PkqOjZpkhKD6WGGLyxY4iCEgj4QhgAzakq0kM0tT5WtU990C4qrWR9hcTV6uQ=;
Received: from mail-wr1-f68.google.com ([209.85.221.68])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jpsDm-0062r3-07
 for kgdb-bugreport@lists.sourceforge.net; Mon, 29 Jun 2020 11:45:13 +0000
Received: by mail-wr1-f68.google.com with SMTP id r12so16159473wrj.13
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 29 Jun 2020 04:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=XGw/iLKNRAiVkZjoBpYpVGlTMGowb6J/RzcIqE9oUnc=;
 b=rS5h5EDVXcM6nddGacPz/Nj3KgrOPH0q0nYOztg+J1s+b0tDo9soLUxF+5ac5OLI08
 4pj4d8PGVhb2QpuWHGjPLdHrKX0AJKO5kd4h+mlDscVYvZ+wmgjgPcaGK+I6f94mzM4l
 fb7mw0e8YVatfs/UV5KEfnEtOEVMtAaikz8UK4gdg/86d82CkVVrazsC2z8uZG7CUXUZ
 niM55Y4S1aOeUjTWaFRV7epBvRNNInwxRoJNp/+oJDa1DqvxWLK+V7ia1o54br2dUWjk
 r2bBnqELUcWJVWzHCzsw9/yfgbDJJaiY6No8zpA3wSx7ZRHXQyrZbqiOr9LQIvxuxb/V
 Q9Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XGw/iLKNRAiVkZjoBpYpVGlTMGowb6J/RzcIqE9oUnc=;
 b=nvrpc9QyzOEj/+6nGFb7chwbSOf96U+XNbA1mNAq0WdKn5ySoKbTXSAvlKmFyk3PMY
 nhCbtLnInkRNrHVr+TfiCEXqITzWtioTWQn7POr1pvOQT8TlI4QPA9REm0ZcwAiKn33E
 7vtfP9Q2YWeAwmcSACV7lxqQTr7eLEwibC455Px9kOqxaE/0kOzwel8GW1H3yUGiYyuU
 rky6j08VgLc4vxfeCgMmftqwKFGxAXkSTK/xLn0ZDsCV/AP4XLqlVIZwIwouZmgcpPwv
 OvGClwSSlnc5RVoK8BGgxxBqYDYaOEUwkPzMZPbXk2ZjV4aDZbxmh/SkAlFHNwUc42xl
 TQpw==
X-Gm-Message-State: AOAM533B3sdA6NMt6wMZNOxbc8kPSOLDfx/cUFiE4MumA6VJSFGHv0sA
 HNeZGTQ9TI/w6qDafzEHKEbAYw==
X-Google-Smtp-Source: ABdhPJxOJjSafM1OFUfqJURXwD3lrGdaznzf+9LM4EAUq/q+VGG6z+FfLqPpw2iGsX1ac9JHkVsJXw==
X-Received: by 2002:adf:c142:: with SMTP id w2mr15839442wre.337.1593431103458; 
 Mon, 29 Jun 2020 04:45:03 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id s10sm17859915wme.31.2020.06.29.04.45.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2020 04:45:02 -0700 (PDT)
Date: Mon, 29 Jun 2020 12:45:01 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Doug Anderson <dianders@chromium.org>
Message-ID: <20200629114501.7aq547dzo6o2abrt@holly.lan>
References: <1592835984-28613-1-git-send-email-sumit.garg@linaro.org>
 <1592835984-28613-4-git-send-email-sumit.garg@linaro.org>
 <20200622160300.avgfhnfkpqzqqtsr@holly.lan>
 <CAFA6WYOmQT-OQvjpy1pVPq2mx5S264bJPd-XfwnDY2BjeoWekg@mail.gmail.com>
 <20200623105934.wvyidi3xgqgd35af@holly.lan>
 <CAD=FV=XHZT9ud0Ze1pDvz-kQy7FMFzd9T6+jM5URt1k5BwQ15g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD=FV=XHZT9ud0Ze1pDvz-kQy7FMFzd9T6+jM5URt1k5BwQ15g@mail.gmail.com>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.68 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.68 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jpsDm-0062r3-07
Subject: Re: [Kgdb-bugreport] [PATCH 3/7] kgdb: Add request_nmi() to the io
 ops table for kgdboc
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 Russell King - ARM Linux admin <linux@armlinux.org.uk>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-serial@vger.kernel.org, Jiri Slaby <jslaby@suse.com>,
 kgdb-bugreport@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Fri, Jun 26, 2020 at 12:44:15PM -0700, Doug Anderson wrote:
> Hi,
> 
> On Tue, Jun 23, 2020 at 3:59 AM Daniel Thompson
> <daniel.thompson@linaro.org> wrote:
> >
> > On Tue, Jun 23, 2020 at 02:07:47PM +0530, Sumit Garg wrote:
> > > On Mon, 22 Jun 2020 at 21:33, Daniel Thompson
> > > <daniel.thompson@linaro.org> wrote:
> > > > > +     irq_set_status_flags(irq, IRQ_NOAUTOEN);
> > > > > +     res = request_nmi(irq, fn, IRQF_PERCPU, "kgdboc", dev_id);
> > > >
> > > > Why do we need IRQF_PERCPU here. A UART interrupt is not normally
> > > > per-cpu?
> > > >
> > >
> > > Have a look at this comment [1] and corresponding check in
> > > request_nmi(). So essentially yes UART interrupt is not normally
> > > per-cpu but in order to make it an NMI, we need to request it in
> > > per-cpu mode.
> > >
> > > [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/kernel/irq/manage.c#n2112
> >
> > Thanks! This is clear.
> >
> > > > > +     if (res) {
> > > > > +             res = request_irq(irq, fn, IRQF_SHARED, "kgdboc", dev_id);
> > > >
> > > > IRQF_SHARED?
> > > >
> > > > Currrently there is nothing that prevents concurrent activation of
> > > > ttyNMI0 and the underlying serial driver. Using IRQF_SHARED means it
> > > > becomes possible for both drivers to try to service the same interrupt.
> > > > That risks some rather "interesting" problems.
> > > >
> > >
> > > Could you elaborate more on "interesting" problems?
> >
> > Er... one of the serial drivers we have allowed the userspace to open
> > will, at best, be stone dead and not passing any characters.
> >
> >
> > > BTW, I noticed one more problem with this patch that is IRQF_SHARED
> > > doesn't go well with IRQ_NOAUTOEN status flag. Earlier I tested it
> > > with auto enable set.
> > >
> > > But if we agree that both shouldn't be active at the same time due to
> > > some real problems(?) then I can rid of IRQF_SHARED as well. Also, I
> > > think we should unregister underlying tty driver (eg. /dev/ttyAMA0) as
> > > well as otherwise it would provide a broken interface to user-space.
> >
> > I don't have a particular strong opinion on whether IRQF_SHARED is
> > correct or not correct since I think that misses the point.
> >
> > Firstly, using IRQF_SHARED shows us that there is no interlocking
> > between kgdb_nmi and the underlying serial driver. That probably tells
> > us about the importance of the interlock than about IRQF_SHARED.
> >
> > To some extent I'm also unsure that kgdb_nmi could ever actually know
> > the correct flags to use in all cases (that was another reason for the
> > TODO comment about poll_get_irq() being a bogus API).
> 
> I do wonder a little bit if the architecture of the "kgdb_nmi_console"
> should change.  I remember looking at it in the past and thinking it a
> little weird that if I wanted to get it to work I'd need to change my
> "console=" command line to go through this new driver and (I guess)
> change the agetty I have running on my serial port to point to
> ttyNMI0.  Is that how it's supposed to work?  Then if I want to do a
> build without kgdb then I need to go in and change my agetty to point
> back at my normal serial port?
> 
> It kinda feels like a better way to much of what the driver does would be to:
> 
> 1. Allow kgdb to sniff incoming serial bytes on a port and look for
> its characters.  We already have this feature in the kernel to a small
> extent for sniffing a break / sysrq character.
> 
> 2. If userspace doesn't happen to have the serial port open then
> ideally we could open the port (using all the standard APIs that
> already exist) from in the kernel and just throw away all the bytes
> (since we already sniffed them).  As soon as userspace tried to open
> the port when it would get ownership and if userspace ever closed the
> port then we'd start reading / throwing away bytes again.
> 
> If we had a solution like that:
> 
> a) No serial drivers would need to change.
> 
> b) No kernel command line parameters would need to change.
> 
> Obviously that solution wouldn't magically get you an NMI, though.
> For that I'd presume the right answer would be to add a parameter for
> each serial driver that can support it to run its rx interrupt in NMI
> mode.

... or allow modal changes to the uart driver when kgdboc comes up?

We already allow UART drivers to de-optimize themselves and use
different code paths when polling is enabled so its not totally crazy
;-).


> Of course, perhaps I'm just confused and crazy and the above is a
> really bad idea.

Thanks for bringing this up.

Sumit and I were chatting last week and our discussion went in a similar
direction (I think not exactly the same which is why it is good to
see your thoughts too).

Personally I think it comes down to how intrusive adding NMI support is
to serial drivers. kgdb_nmi is rather hacky and feels a bit odd to
enable. It is clearly intended to avoid almost all changes to the UART
driver. On our side we have been wondering whether the serial core can
add helpers to make it easy for a serial driver to implement an simple,
safe but not optimal NMI implementation. Making it easy to have
safety-first might make NMI more palatable.


> Speaking of confused: is there actually any way to use the existing
> kgdb NMI driver (CONFIG_SERIAL_KGDB_NMI) in mainline without out of
> tree patches?  When I looked before I assumed it was just me that was
> outta luck because I didn't have NMI at the time, but I just did some
> grepping and I can't find anyplace in mainline where
> "arch_kgdb_ops.enable_nmi" would not be NULL.  Did I miss it, or do we
> need out-of-tree patches to enable this?

Out-of-tree...

If, after looking at other approaches, we do all agree to nuke kgdb_nmi
then there shouldn't be much impediment (nor that many tears).


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
