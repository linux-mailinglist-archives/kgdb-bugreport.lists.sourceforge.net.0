Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 25219222BB9
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 16 Jul 2020 21:16:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jw9Mo-0001SC-Us
	for lists+kgdb-bugreport@lfdr.de; Thu, 16 Jul 2020 19:16:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <keescook@chromium.org>) id 1jw9Mn-0001S1-OE
 for kgdb-bugreport@lists.sourceforge.net; Thu, 16 Jul 2020 19:16:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2R0hcRnXsJS4VXyiriDanEq/mQczbWkrFO+xv3Ye6s4=; b=Fx8/+iT6jirM5LBAbAq80dicSz
 Hl5kn0wwjviEkrdcZTATHWtWnuxQa7qvNIZ8IzCXqAaB/yqni7mwF3tuzXfx46C/uOx2jrFqIGtMN
 Y17Q+Q1gJRByiHBNi+3jXn5w1+svz31Bq+kNeTtqrj5+o9VpenIkeDYZQYwPTUvzvVss=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2R0hcRnXsJS4VXyiriDanEq/mQczbWkrFO+xv3Ye6s4=; b=c+s5MxtliGVjfaek7zPoW+Kvsd
 gt4DNXBFE8V+SR2LNhw9cffQ9sdabBSFtulhArSFykPajUntrYTN4CQKQ8GWSYHq3/yMDBBLIRRyg
 RzkUSs77pQoabShU5Kt+AiT707Ae4yNeXpQy8cekqfy9mlKvC4OcGQTjv3fqrzFvxpX8=;
Received: from mail-pf1-f193.google.com ([209.85.210.193])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jw9MY-00AwiX-5d
 for kgdb-bugreport@lists.sourceforge.net; Thu, 16 Jul 2020 19:16:25 +0000
Received: by mail-pf1-f193.google.com with SMTP id 207so4145394pfu.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 16 Jul 2020 12:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=2R0hcRnXsJS4VXyiriDanEq/mQczbWkrFO+xv3Ye6s4=;
 b=ZBulK0WZzf/Y2plsJIiBiP9vBDDMB7cKE4nNyO7pI4jhAiFahLl13+wjjYl4AYx5BB
 otJeoT7KMXmj//B0s5TndSWJM7ep3jPNHzKSwrpR80GkT/ENBrVdogHDfc7FSXQgqchK
 la7hTG8ks3MzuTa72KfZtSagY7XpH9MYfx1mQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2R0hcRnXsJS4VXyiriDanEq/mQczbWkrFO+xv3Ye6s4=;
 b=hVvpAyEvZSqXRUEqGYmCQ0HLaTvZbW1idm/dx4kSiCtGaUylO1QjnlUf5oKe7c67ka
 aS8McK7gwqU28oZWDbzQ3XAHYBYDQzCkV5PB9m+l+W8oxOoWymC1RjH2xvrFee5xWaSj
 GOoBJOgonU4tfSC6VyI/mMP+XDFEz9FNl6wiTLGZeB3a3S5ga1w4kr9DN1QT7sH6XFkn
 PSWp9s/vWwvAXaCwwFWx9M1mo3jZvoYP9rzTA/3ak/11/1zcu0XWmmu6fS6Fj69Oqfgm
 Zmtw9t2DxxY1tg6tw+9LwqK36O3Iju+RpySuFCxnqpzJ6bIurLrmUqbEKzkYv0CxMJ2d
 BWGw==
X-Gm-Message-State: AOAM530KmVPrgD/8Of0qlsC3Bxa8tArOqwhZkwc4fvtalhtnRfM4oxv2
 Mi3+uyPasYIWn56Q9DuwtHK7JQ==
X-Google-Smtp-Source: ABdhPJz1hoi+gTw0MHgO0dM+96Dp9MZSCNtNi6/yuZgpSobcItifHoGm+Bd2+MNyMCABANHPmkEEMg==
X-Received: by 2002:a65:664a:: with SMTP id z10mr5423029pgv.352.1594926957331; 
 Thu, 16 Jul 2020 12:15:57 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id h15sm5618413pfo.192.2020.07.16.12.15.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2020 12:15:56 -0700 (PDT)
Date: Thu, 16 Jul 2020 12:15:55 -0700
From: Kees Cook <keescook@chromium.org>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <202007161215.5C0CE54AB@keescook>
References: <20200716030847.1564131-1-keescook@chromium.org>
 <20200716030847.1564131-3-keescook@chromium.org>
 <20200716112914.GK12769@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200716112914.GK12769@casper.infradead.org>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.193 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 TIME_LIMIT_EXCEEDED    Exceeded time limit / deadline
X-Headers-End: 1jw9MY-00AwiX-5d
Subject: Re: [Kgdb-bugreport] [PATCH 2/3] treewide: Replace
 DECLARE_TASKLET() with DECLARE_TASKLET_OLD()
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
Cc: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Oscar Carter <oscar.carter@gmx.com>, Mitchell Blank Jr <mitch@sfgoth.com>,
 kernel-hardening@lists.openwall.com, Peter Zijlstra <peterz@infradead.org>,
 kgdb-bugreport@lists.sourceforge.net,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, alsa-devel@alsa-project.org,
 Allen Pais <allen.lkml@gmail.com>, netdev@vger.kernel.org,
 Christian Gromm <christian.gromm@microchip.com>, Will Deacon <will@kernel.org>,
 devel@driverdev.osuosl.org, Jonathan Corbet <corbet@lwn.net>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 "David S. Miller" <davem@davemloft.net>,
 Masahiro Yamada <masahiroy@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Julian Wiedmann <jwi@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Nishka Dasgupta <nishkadg.linux@gmail.com>, Jiri Slaby <jslaby@suse.com>,
 Jakub Kicinski <kuba@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 Wambui Karuga <wambui.karugax@gmail.com>, Vasily Gorbik <gor@linux.ibm.com>,
 linux-s390@vger.kernel.org, linux-kernel@vger.kernel.org,
 Heiko Carstens <hca@linux.ibm.com>, linux-input@vger.kernel.org,
 Ursula Braun <ubraun@linux.ibm.com>, Stephen Boyd <swboyd@chromium.org>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Jaroslav Kysela <perex@perex.cz>,
 Felipe Balbi <balbi@kernel.org>, Kyungtae Kim <kt0755@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Kevin Curtis <kevin.curtis@farsite.co.uk>, linux-usb@vger.kernel.org,
 Jason Wessel <jason.wessel@windriver.com>,
 Romain Perier <romain.perier@gmail.com>, Karsten Graul <kgraul@linux.ibm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Thu, Jul 16, 2020 at 12:29:14PM +0100, Matthew Wilcox wrote:
> On Wed, Jul 15, 2020 at 08:08:46PM -0700, Kees Cook wrote:
> > This converts all the existing DECLARE_TASKLET() (and ...DISABLED)
> > macros with DECLARE_TASKLET_OLD() in preparation for refactoring the
> > tasklet callback type. All existing DECLARE_TASKLET() users had a "0"
> > data argument, it has been removed here as well.
> > 
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> [...]
> >  16 files changed, 26 insertions(+), 21 deletions(-)
> 
> This is about 5% of what needs to change.  There are 350 callers of
> tasklet_init(), and that still takes a 'data' argument.

Yup, please see the referenced tree. This "series" is just the
ground-work for allowing the rest of the 350 patches to land with calls
to the new tasklet_setup() API, and associated prototype and
container_of() changes.

-- 
Kees Cook


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
