Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF891D56AB
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 15 May 2020 18:52:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jZdZk-0001DC-UP
	for lists+kgdb-bugreport@lfdr.de; Fri, 15 May 2020 16:52:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1jZdZk-0001D2-0o
 for kgdb-bugreport@lists.sourceforge.net; Fri, 15 May 2020 16:52:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=//QUXJb2hfEP5KSpFr1jCZS2lxtzuUgoxlZm2dmFvFY=; b=IA56NUHpqhHuBO32/k4k3XjzMX
 CkN8XEcLCSDE2yOcTFboQaWmSzzUsGcZIO+k64fOeEAZgyTHEsY8lhkFKiEsamn1q/l3rh4n/l4Pe
 Rd18FB52jRR+ime8Roz+f/PtGiQDYOkl39EQZAJYpBNyR0svPaq6ggM9Oa4vh9I8fCHg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=//QUXJb2hfEP5KSpFr1jCZS2lxtzuUgoxlZm2dmFvFY=; b=HckXYPNgq5BWhyXN7z9paW1U79
 YfFWuUcal1FwdDkBkzM5mlG2ydZtkxNQKrqFCLicGkGvd/KuWxIlcB7z8YjPIZOJa5k+e2xWCsWLc
 Yn1aAIf0+5QGt8bXI6JHeSPYA2A1EjDnwezxs2N0nlGkTS2wLpjP2HbHLjr95y8Ugd9I=;
Received: from mail-vs1-f65.google.com ([209.85.217.65])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jZdZi-008o9x-Mx
 for kgdb-bugreport@lists.sourceforge.net; Fri, 15 May 2020 16:52:43 +0000
Received: by mail-vs1-f65.google.com with SMTP id 1so1634605vsl.9
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 15 May 2020 09:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=//QUXJb2hfEP5KSpFr1jCZS2lxtzuUgoxlZm2dmFvFY=;
 b=QVbQZPOqP3I4QaDmNr61NBvJ2m4f0FA0qcnvxdFVkElx5ChUuXTVkiqBWPo1Lc9Svp
 gfslahjg2HvG56kqiAX8dTsXZpoCex+FFddG1M9rgY2zxl3BsjVqUNAAccrlXYZYnbeU
 c4XsdUEEqV52JxZSsm03Nz8rVclM6Q6jWWzWI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=//QUXJb2hfEP5KSpFr1jCZS2lxtzuUgoxlZm2dmFvFY=;
 b=eFVU80WM7Vn/Or341TBb+wTkRtOkff7ZYPb6mYhGJoMsJdBok0rLKRaOGrR63DQaU4
 oXoG0/EYkG0Oa5CUzpAteIF/G31hUto4PRsaXjIN7Vx4Z2Yy4V3JsnNrdoltGqw8HC0t
 vAL3GjRz94B1cotYXLbxIt5aOdTBJS8D9mx45UX8Bu7vEL3bODIZSPseonPru0OnnbXG
 ehOI/q7wUmrUGuSWDOg6cmqbaVkH9cEgU+ehr5P32ivEMgZtY06LNQFWkqQ9uA0W2WeC
 qBeJKvXxEBoDjicHy3xzFf2IoaQ9ZIVJI8QkvNhd8xbdZK+Nq9xacXGOZ81VhS8Z3Jmk
 ygkw==
X-Gm-Message-State: AOAM531KN2x5pAzayosDAuBPZkHp/+5Haq6YLimDZFRtVmVhJOxIjmtm
 CgEj04P2UTw7oBz+zP1gdsm/RQ3o1Js=
X-Google-Smtp-Source: ABdhPJxkpemJZyzb2RG5k0WC47w0X64hj0U7X9GJ89Dw/ItWtygFH04qXKe9N8QAz46aRT6ZrOfhUg==
X-Received: by 2002:a05:6102:318b:: with SMTP id
 c11mr3392070vsh.57.1589561549576; 
 Fri, 15 May 2020 09:52:29 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com.
 [209.85.222.48])
 by smtp.gmail.com with ESMTPSA id x81sm709086vkd.15.2020.05.15.09.52.28
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 May 2020 09:52:28 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id s5so1033793uad.4
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 15 May 2020 09:52:28 -0700 (PDT)
X-Received: by 2002:ab0:69cc:: with SMTP id u12mr268225uaq.22.1589561548021;
 Fri, 15 May 2020 09:52:28 -0700 (PDT)
MIME-Version: 1.0
References: <1589273314-12060-1-git-send-email-sumit.garg@linaro.org>
 <20200512142533.ta4uejwmq5gchtlx@holly.lan>
 <CAFA6WYOV7oPbYE=9fXueYMacb5wv0r9T6F8tmECt-Eafe-fctw@mail.gmail.com>
 <20200514084230.GO17734@linux-b0ei>
 <CAFA6WYPSsgdAB-wJC0e2YkVkW0XsqQsu5wrn4iB4M-cwvS7z2g@mail.gmail.com>
 <20200515085021.GS17734@linux-b0ei>
 <20200515103308.GD42471@jagdpanzerIV.localdomain>
 <CAFA6WYOBsimP1j8Fwq4OcePEug4MGoaY3wTTTVydHtTphZ-FTw@mail.gmail.com>
 <20200515163638.GI42471@jagdpanzerIV.localdomain>
In-Reply-To: <20200515163638.GI42471@jagdpanzerIV.localdomain>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 15 May 2020 09:52:16 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XohG8ErL=_fyuA+MXEmfp55aW+SxSunb6YPRYj77bOxQ@mail.gmail.com>
Message-ID: <CAD=FV=XohG8ErL=_fyuA+MXEmfp55aW+SxSunb6YPRYj77bOxQ@mail.gmail.com>
To: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.217.65 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.217.65 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jZdZi-008o9x-Mx
Subject: Re: [Kgdb-bugreport] [PATCH] printk/kdb: Redirect printk messages
 into kdb in any context
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
 John Ogness <john.ogness@linutronix.de>, Arnd Bergmann <arnd@arndb.de>,
 Petr Mladek <pmladek@suse.com>, Peter Zijlstra <peterz@infradead.org>,
 kgdb-bugreport@lists.sourceforge.net,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

On Fri, May 15, 2020 at 9:36 AM Sergey Senozhatsky
<sergey.senozhatsky@gmail.com> wrote:
>
> On (20/05/15 17:32), Sumit Garg wrote:
> > > Can I please have some context what problem does this solve?
> >
> > You can find the problem description here [1] which leads to this fix.
>
> [..]
>
> > [1] https://lkml.org/lkml/2020/5/12/213
>
> Thanks for the link. I'm slightly surprised it took so many years
> to notice the addition of printk_nmi/printk_safe :)

I haven't looked at all the details, but IIUC we don't normally enter
kgdb on the primary CPU through a NMI context, but the secondary ones
(on x86) always do.  Most things are run on the primary CPU and I
think it's relatively unlikely for people to change the primary CPU
(though it is possible).

Probably things got worse when I changed the way "btc" worked to make
it common between all architectures.  See commit 9ef50a686b53
("UPSTREAM: kdb: Fix stack crawling on 'running' CPUs that aren't the
master").  Though theoretically someone could have changed masters and
reproduced the problem with a simple "bt" before my patch, now a
relatively normal command "btc" would tickle the problem.  I didn't
notice it because I work almost totally on arm/arm64 machines and they
don't have NMI (yet).

In general I've always wondered about why (historically) kgdb bugs
have sometimes gone unnoticed for a period of time.  That does seem to
be changing, though, and I've seen a few longstanding bugs getting
fixed recently.  :-)


-Doug


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
