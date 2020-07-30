Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 466A7232C39
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 30 Jul 2020 09:04:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1k12by-0000O9-05
	for lists+kgdb-bugreport@lfdr.de; Thu, 30 Jul 2020 07:04:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <tglx@linutronix.de>) id 1k12bv-0000Ny-PW
 for kgdb-bugreport@lists.sourceforge.net; Thu, 30 Jul 2020 07:04:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Mz+qNrmSuHhP762sVPCCbD6ZtoTLt49x/k2ylV/iW04=; b=IIHyiAuuX0EIjOsJbipxQahWy
 EiKbe692xStYpTvO1uogyiXD0ySndtcyQh/1V8srXWEZdgcj7wCA+l7PHN8pNbwr4n9xf+CdwVSLo
 D6QPLTVhrEDyC2Ghcoh+Kzz/kdS9FOCRPt44ebVLol/8miF3XofhHu3IkVxaNjbcys4V0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Mz+qNrmSuHhP762sVPCCbD6ZtoTLt49x/k2ylV/iW04=; b=CuYyuUO8P+KChrSxcHxsvrKKbD
 85eKVM52hvWUG7wSRMFtIWv49byh9usMA1HL7cK0rxTWPDYA0w/KCl0XG+RsxwE8s6FNWa198qeRu
 QlgibbJ+G3FLmIRc1MP7RCDKtNXxzpgn18qLKSwKFUVnPLSbCPAXGPJk1hjljjqRn6xk=;
Received: from galois.linutronix.de ([193.142.43.55])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1k12bt-00EPID-KQ
 for kgdb-bugreport@lists.sourceforge.net; Thu, 30 Jul 2020 07:04:15 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1596092635;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Mz+qNrmSuHhP762sVPCCbD6ZtoTLt49x/k2ylV/iW04=;
 b=ATVq9r2ySKvrHhR1Ew5gfobXzkJOa7AojOTliB75MUHbI823o3fQ0ntCWem48PvvRKqB9H
 Rt9hIre2E+faffSDe258p7pUnpiLxNrY9VnSFh5IqME+CrtiHzj9WxaiUGeZBdFpHIOAmv
 wnV7yVr+HeeHgOF9V1gPxEw/ndMBAD+sa6snxxFjk+V/ROFhMjUReFF9eq8Y2XWjuyHQdF
 6H7QimUGQoU88mR0cBx508aZtEEZImB+4c+3QuIGaiVRAuGq64btoT4du5WsNzqH7FOP2m
 IZz/+Qf17vLzhSMchX8tfx5XVjWjF9aTOve0tVRFY3jRZHZmgLJt0KbdLSrW8Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1596092635;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Mz+qNrmSuHhP762sVPCCbD6ZtoTLt49x/k2ylV/iW04=;
 b=OgiJQ3sVwNFJT1r4oP0n3TmmSrJH2lyZ7rxBtMWP23shTrTVU6KuEFirMQvosT5GwEbdK2
 QqQs4lhxrmHSNbAw==
To: Kees Cook <keescook@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
In-Reply-To: <20200716030847.1564131-1-keescook@chromium.org>
References: <20200716030847.1564131-1-keescook@chromium.org>
Date: Thu, 30 Jul 2020 09:03:55 +0200
Message-ID: <87h7tpa3hg.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.5 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1k12bt-00EPID-KQ
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
Cc: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Oscar Carter <oscar.carter@gmx.com>, Mitchell Blank Jr <mitch@sfgoth.com>,
 kernel-hardening@lists.openwall.com, Peter Zijlstra <peterz@infradead.org>,
 kgdb-bugreport@lists.sourceforge.net,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, alsa-devel@alsa-project.org,
 Allen Pais <allen.lkml@gmail.com>,
 Christian Gromm <christian.gromm@microchip.com>, Will Deacon <will@kernel.org>,
 devel@driverdev.osuosl.org, Jonathan Corbet <corbet@lwn.net>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 "David S. Miller" <davem@davemloft.net>,
 Masahiro Yamada <masahiroy@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Julian Wiedmann <jwi@linux.ibm.com>, "Matthew
 Wilcox \(Oracle\)" <willy@infradead.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Nishka Dasgupta <nishkadg.linux@gmail.com>, Jiri Slaby <jslaby@suse.com>,
 Jakub Kicinski <kuba@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 Wambui Karuga <wambui.karugax@gmail.com>, Kees Cook <keescook@chromium.org>,
 Vasily Gorbik <gor@linux.ibm.com>, linux-s390@vger.kernel.org,
 linux-kernel@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
 linux-input@vger.kernel.org, Ursula Braun <ubraun@linux.ibm.com>,
 Stephen Boyd <swboyd@chromium.org>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Harald Freudenberger <freude@linux.ibm.com>, Jaroslav Kysela <perex@perex.cz>,
 Felipe Balbi <balbi@kernel.org>, Kyungtae Kim <kt0755@gmail.com>,
 netdev@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Kevin Curtis <kevin.curtis@farsite.co.uk>, linux-usb@vger.kernel.org,
 Jason Wessel <jason.wessel@windriver.com>,
 Romain Perier <romain.perier@gmail.com>, Karsten Graul <kgraul@linux.ibm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Kees,

Kees Cook <keescook@chromium.org> writes:
> This is the infrastructure changes to prepare the tasklet API for
> conversion to passing the tasklet struct as the callback argument instead
> of an arbitrary unsigned long. The first patch details why this is useful
> (it's the same rationale as the timer_struct changes from a bit ago:
> less abuse during memory corruption attacks, more in line with existing
> ways of doing things in the kernel, save a little space in struct,
> etc). Notably, the existing tasklet API use is much less messy, so there
> is less to clean up.
>
> It's not clear to me which tree this should go through... Greg since it
> starts with a USB clean-up, -tip for timer or interrupt, or if I should
> just carry it. I'm open to suggestions, but if I don't hear otherwise,
> I'll just carry it.
>
> My goal is to have this merged for v5.9-rc1 so that during the v5.10
> development cycle the new API will be available. The entire tree of
> changes is here[1] currently, but to split it up by maintainer the
> infrastructure changes need to be landed first.
>
> Review and Acks appreciated! :)

I'd rather see tasklets vanish from the planet completely, but that's
going to be a daring feat. So, grudgingly:

Acked-by: Thomas Gleixner <tglx@linutronix.de>



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
