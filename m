Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 75371222BD6
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 16 Jul 2020 21:24:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jw9Ue-0001gE-9y
	for lists+kgdb-bugreport@lfdr.de; Thu, 16 Jul 2020 19:24:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <keescook@chromium.org>) id 1jw9Ud-0001g7-By
 for kgdb-bugreport@lists.sourceforge.net; Thu, 16 Jul 2020 19:24:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IO5rF0v38hkORnZpPQ2np7PkHTT7l3o2Frf1znSvMCA=; b=Sh5OqWmoTULbuLMIqHGI6uPyJC
 z4LlEeCFRncNvJZZSAev05BSWUgJogqKcQ9cYAgsG7K8kCevaYXevp8GawbKe+J0hOV2EhxvL9NmA
 XyB5pxG1LNE6RVRFm9n0xl2rT6ieNH+bXt/iMyBvN49T4RObultaBZN3B6AoEHtF2u48=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IO5rF0v38hkORnZpPQ2np7PkHTT7l3o2Frf1znSvMCA=; b=U3wCUHCQvZnZiENG9WuFZzDKlo
 zL4qAjNELPlv7o2R9Xz+ZoH6gy9QILe+kO7DlmKl9I3caBPj+k//cVdCDL5OGI4nZjdruxYtBa3Ha
 8KwvUrxRanLvgGQYRtXWp6FzUWHVSXyInBUrszLYU5VUHrm67e8T0DPK7KXkOU5Hh9Oo=;
Received: from mail-pj1-f65.google.com ([209.85.216.65])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jw9UY-003Q6T-Qh
 for kgdb-bugreport@lists.sourceforge.net; Thu, 16 Jul 2020 19:24:31 +0000
Received: by mail-pj1-f65.google.com with SMTP id k71so5293680pje.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 16 Jul 2020 12:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=IO5rF0v38hkORnZpPQ2np7PkHTT7l3o2Frf1znSvMCA=;
 b=MoeXRnczoJvOTiX060NRDer3ic+Z0a6OAKDDzvlghJHJsuwLM+IhpBPYCW1h0hZNZh
 Fr5kyGgY0/SatP2EZptwciRkxUEZBeWULPC9tbngCSgNOCvd0NXvOeL8OmnqU6ynZicD
 iZLZdIgB2wXCD8oLjuasdEEdCIEAfOKV/ccMk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=IO5rF0v38hkORnZpPQ2np7PkHTT7l3o2Frf1znSvMCA=;
 b=rl3xnhKI+U7nDjNhZ0q145gcUZsZ0gIanAjKxEtusb7CLXkMqxEIMQ1I9dIqmhm2PL
 o+ZoJBSKo35eFVmbZwHHGsL3LjtWFG0Mdu14gPtjmlTb18seCBVN8WIU3UlV424nRLpF
 wTma/z3g8mrKFw1LbiB5Ho8DXjhFVWnhR8b/t4DIQf8g+teh8bl+EoWGCnvtvHVUquFr
 stZLeCW0JkoxWXZ4xZuPAU+bFjW61ifMpCDys1dp6tcShY/17d40LlOuDfAHbLae4Msz
 KSM8OWB1QoNzjra3Z4MU4EqKJsofTWUGt8niwt+KbslXopmiwq5GVamSkS8FgPnxvFgR
 71xw==
X-Gm-Message-State: AOAM530Ebo6cjs9uxbQW1I1zVX1xBhnAHxKbI+kljEQiLlE8jxhfGy3o
 g66iYHLZ+M0AVDIU2L0dgTfChQ==
X-Google-Smtp-Source: ABdhPJy0sUnqF9h52WMr6418CCHExwqoVmt3MmuGhwouhxSV6Mqarvy7mOWSh3mLcM/3Qo2Kub5J7g==
X-Received: by 2002:a17:90a:d30c:: with SMTP id
 p12mr6742185pju.4.1594927454098; 
 Thu, 16 Jul 2020 12:24:14 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id f29sm5669290pga.59.2020.07.16.12.24.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2020 12:24:13 -0700 (PDT)
Date: Thu, 16 Jul 2020 12:24:12 -0700
From: Kees Cook <keescook@chromium.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Message-ID: <202007161223.19FB352B5@keescook>
References: <20200716030847.1564131-1-keescook@chromium.org>
 <20200716075718.GM10769@hirez.programming.kicks-ass.net>
 <20200716081538.2sivhkj4hcyrusem@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200716081538.2sivhkj4hcyrusem@linutronix.de>
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.65 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.216.65 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jw9UY-003Q6T-Qh
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
 kgdb-bugreport@lists.sourceforge.net, alsa-devel@alsa-project.org,
 Allen Pais <allen.lkml@gmail.com>, netdev@vger.kernel.org,
 Christian Gromm <christian.gromm@microchip.com>, Will Deacon <will@kernel.org>,
 devel@driverdev.osuosl.org, Jonathan Corbet <corbet@lwn.net>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 "David S. Miller" <davem@davemloft.net>,
 Masahiro Yamada <masahiroy@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Julian Wiedmann <jwi@linux.ibm.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
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

On Thu, Jul 16, 2020 at 10:15:38AM +0200, Sebastian Andrzej Siewior wrote:
> On 2020-07-16 09:57:18 [+0200], Peter Zijlstra wrote:
> > 
> > there appear to be hardly any users left.. Can't we stage an extinction
> > event here instead?
> 
> Most of the time the tasklet is scheduled from an interrupt handler. So
> we could get rid of these tasklets by using threaded IRQs.

Perhaps I can add a comment above the tasklet API area in interrupt.h?

-- 
Kees Cook


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
