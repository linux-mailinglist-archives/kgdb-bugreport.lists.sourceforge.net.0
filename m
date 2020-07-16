Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 73CEA221D6F
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 16 Jul 2020 09:30:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jvyLY-00008Q-9m
	for lists+kgdb-bugreport@lfdr.de; Thu, 16 Jul 2020 07:30:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <gregkh@linuxfoundation.org>) id 1jvyLX-00008J-AD
 for kgdb-bugreport@lists.sourceforge.net; Thu, 16 Jul 2020 07:30:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QKvRVk84xQUx8605vLEDhGc5VOYh6YUOxuh3TPTiCHM=; b=WD3QKJ+XIgZ4WlI6bzpNsR5dHt
 Si62eglmTJtYXQ3diF7sDPIJP+a3taILdJjh3YSZdIwRy02YcLP701kG/iiQYYjhpiyLUK6ViO/VQ
 6lXrNDX4ukFIpCZIM+bZQbFf9tbNbW8PZW1NeRJxZijLAyZbeUhSqquB/HY953CGRx4M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QKvRVk84xQUx8605vLEDhGc5VOYh6YUOxuh3TPTiCHM=; b=hsCgGfPNnvygol6/zVgf8jkxoW
 p8L3ugmbVhqVJI025fu1JHsrEC3mAg/mJQ7BQ5kQ4nw8/lN2NjqYgg5J86pshsZML9VJBhGtPVlen
 EJlUY8I9cJoJWCVXpviFNiZUWy87GPzy0nfQhiBUXr8Kuoz6OrAkVQiwOebGP5G6rCg8=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jvyLW-005QlN-2H
 for kgdb-bugreport@lists.sourceforge.net; Thu, 16 Jul 2020 07:30:23 +0000
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D622D206C1;
 Thu, 16 Jul 2020 07:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594884616;
 bh=mn6iTBJseqW6x95DXLzjCrLI7Ry2VVFhniqqXYPIzaE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Phc6jm75BYs2701ce9G8bX4UnXRMO9gP//NOxj7gAtA+SR+gVk+ehe0idhpetsJbC
 6qT1RZjEEosqxo95k/Yl4CU/mLc7bykaJGRcZSAU6YGhwz/a2yRCZIMAj+095bxmQv
 6PeXnkbT8e99OL/8Dd8AnTc+6KMVnZ5RGOVEV95A=
Date: Thu, 16 Jul 2020 09:30:10 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Kees Cook <keescook@chromium.org>
Message-ID: <20200716073010.GB971895@kroah.com>
References: <20200716030847.1564131-1-keescook@chromium.org>
 <20200716030847.1564131-4-keescook@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200716030847.1564131-4-keescook@chromium.org>
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.5 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jvyLW-005QlN-2H
Subject: Re: [Kgdb-bugreport] [PATCH 3/3] tasklet: Introduce new
 initialization API
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
 Oscar Carter <oscar.carter@gmx.com>, Mitchell Blank Jr <mitch@sfgoth.com>,
 kernel-hardening@lists.openwall.com, Peter Zijlstra <peterz@infradead.org>,
 kgdb-bugreport@lists.sourceforge.net,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Christian Gromm <christian.gromm@microchip.com>,
 Kevin Curtis <kevin.curtis@farsite.co.uk>, Will Deacon <will@kernel.org>,
 devel@driverdev.osuosl.org, linux-s390@vger.kernel.org,
 Daniel Thompson <daniel.thompson@linaro.org>, Jonathan Corbet <corbet@lwn.net>,
 Masahiro Yamada <masahiroy@kernel.org>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Julian Wiedmann <jwi@linux.ibm.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Nishka Dasgupta <nishkadg.linux@gmail.com>, Jiri Slaby <jslaby@suse.com>,
 Jakub Kicinski <kuba@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 Wambui Karuga <wambui.karugax@gmail.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, linux-input@vger.kernel.org,
 Ursula Braun <ubraun@linux.ibm.com>, Stephen Boyd <swboyd@chromium.org>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Jaroslav Kysela <perex@perex.cz>,
 Felipe Balbi <balbi@kernel.org>, Kyungtae Kim <kt0755@gmail.com>,
 netdev@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Allen Pais <allen.lkml@gmail.com>, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, Jason Wessel <jason.wessel@windriver.com>,
 Karsten Graul <kgraul@linux.ibm.com>, Romain Perier <romain.perier@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Wed, Jul 15, 2020 at 08:08:47PM -0700, Kees Cook wrote:
> From: Romain Perier <romain.perier@gmail.com>
> 
> Nowadays, modern kernel subsystems that use callbacks pass the data
> structure associated with a given callback as argument to the callback.
> The tasklet subsystem remains one which passes an arbitrary unsigned
> long to the callback function. This has several problems:
> 
> - This keeps an extra field for storing the argument in each tasklet
>   data structure, it bloats the tasklet_struct structure with a redundant
>   .data field
> 
> - No type checking can be performed on this argument. Instead of
>   using container_of() like other callback subsystems, it forces callbacks
>   to do explicit type cast of the unsigned long argument into the required
>   object type.
> 
> - Buffer overflows can overwrite the .func and the .data field, so
>   an attacker can easily overwrite the function and its first argument
>   to whatever it wants.
> 
> Add a new tasklet initialization API, via DECLARE_TASKLET() and
> tasklet_setup(), which will replace the existing ones.
> 
> This work is greatly inspired by the timer_struct conversion series,
> see commit e99e88a9d2b0 ("treewide: setup_timer() -> timer_setup()")
> 
> To avoid problems with both -Wcast-function-type (which is enabled in
> the kernel via -Wextra is several subsystems), and with mismatched
> function prototypes when build with Control Flow Integrity enabled,
> this adds the "use_callback" member to let the tasklet caller choose
> which union member to call through. Once all old API uses are removed,
> this and the .data member will be removed as well. (On 64-bit this does
> not grow the struct size as the new member fills the hole after atomic_t,
> which is also "int" sized.)
> 
> Signed-off-by: Romain Perier <romain.perier@gmail.com>
> Co-developed-by: Allen Pais <allen.lkml@gmail.com>
> Signed-off-by: Allen Pais <allen.lkml@gmail.com>
> Co-developed-by: Kees Cook <keescook@chromium.org>
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>  include/linux/interrupt.h | 24 +++++++++++++++++++++++-
>  kernel/softirq.c          | 18 +++++++++++++++++-
>  2 files changed, 40 insertions(+), 2 deletions(-)

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
