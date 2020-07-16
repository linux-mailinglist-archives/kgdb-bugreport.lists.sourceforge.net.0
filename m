Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 95151222138
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 16 Jul 2020 13:17:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jw1sr-0003Mi-D7
	for lists+kgdb-bugreport@lfdr.de; Thu, 16 Jul 2020 11:17:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <bigeasy@linutronix.de>) id 1jvzKl-0003MD-U3
 for kgdb-bugreport@lists.sourceforge.net; Thu, 16 Jul 2020 08:33:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Yn1umK+caUdMmMSNg+DEfBz4G3dj7XgdwXV/exFiYfQ=; b=QvgeZHx2rlc6I2euPrF4vTGJ/I
 pvz9SUXjC4NFrUdgMSUGiZdl4v3E6rbYyM5zL51plrMJDb1fitKrkGTDIxruL+32NjW3kzu7Knj6C
 FYM84+EIaPN6Z+hpyzrepdrz8oomSj0J/F1gS+PG7IvZejqfzKssxT6uHwWd8/d4qv9o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Yn1umK+caUdMmMSNg+DEfBz4G3dj7XgdwXV/exFiYfQ=; b=YkpE/QBdMpV4LwKIW4lmewoFrL
 gCYhqHp90bF25Wx757pUcQMOVe547TT0EoBGaWOKyIiPu9/bltTOiazIhD4Ux5Rn66/5yclsuc7kt
 etq44zWbCXqGLaw3ASBxTdZZ+Qb5jvzoHSxAlFEE0JXywn5WfxVDinWoHS1+0EUtuGzo=;
Received: from galois.linutronix.de ([193.142.43.55])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jvzKj-002VBk-Fe
 for kgdb-bugreport@lists.sourceforge.net; Thu, 16 Jul 2020 08:33:39 +0000
Date: Thu, 16 Jul 2020 10:15:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1594887345;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Yn1umK+caUdMmMSNg+DEfBz4G3dj7XgdwXV/exFiYfQ=;
 b=UaFBKEA6NODD9CMCeCn4AwJJl+5Kb+eLxkOEAaardBheygNhikE3rlTYEMw5vaR51/Lawq
 7mrw/y3Z1AkwNQOP9LPdJjqePDdaFl5hWIwglIWh3mfsb2WuyFAVQIcALQM33iIyFKGFOj
 fa03u9uEJlrow8rG5a37UEKVEfdsK0ZmcBpclOT7xWQ9hH31YQZe7VjvBJv9FND71PPU45
 1K1qbauIzUgepakJxCLbRbOaMY0m7eICOmpcgqw4KVnQDM7Lkbns9Ap6g4Jqab08zfGYM1
 yr4OtcJqxtSX1gCSMt8B+famnlapOvVi1qj2ZLSe4MQSiJXSwlds1pkhkro8Jg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1594887345;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Yn1umK+caUdMmMSNg+DEfBz4G3dj7XgdwXV/exFiYfQ=;
 b=5Sk5Wz7PNQjRQnpYCfpv1U5JHmR5MI/fixBOjSbTfFHFRjXeJYKxTA/HCkWq4XYLVNfwXY
 n6eqRIBMER6pBPCA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Peter Zijlstra <peterz@infradead.org>
Message-ID: <20200716081538.2sivhkj4hcyrusem@linutronix.de>
References: <20200716030847.1564131-1-keescook@chromium.org>
 <20200716075718.GM10769@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200716075718.GM10769@hirez.programming.kicks-ass.net>
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.5 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jvzKj-002VBk-Fe
X-Mailman-Approved-At: Thu, 16 Jul 2020 11:16:59 +0000
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
 kernel-hardening@lists.openwall.com, kgdb-bugreport@lists.sourceforge.net,
 alsa-devel@alsa-project.org, Allen Pais <allen.lkml@gmail.com>,
 netdev@vger.kernel.org, Christian Gromm <christian.gromm@microchip.com>,
 Will Deacon <will@kernel.org>, devel@driverdev.osuosl.org,
 Jonathan Corbet <corbet@lwn.net>, Daniel Thompson <daniel.thompson@linaro.org>,
 "David S. Miller" <davem@davemloft.net>,
 Masahiro Yamada <masahiroy@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Julian Wiedmann <jwi@linux.ibm.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Nishka Dasgupta <nishkadg.linux@gmail.com>, Jiri Slaby <jslaby@suse.com>,
 Jakub Kicinski <kuba@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 Wambui Karuga <wambui.karugax@gmail.com>, Kees Cook <keescook@chromium.org>,
 Vasily Gorbik <gor@linux.ibm.com>, linux-s390@vger.kernel.org,
 linux-kernel@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
 linux-input@vger.kernel.org, Ursula Braun <ubraun@linux.ibm.com>,
 Stephen Boyd <swboyd@chromium.org>,
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

On 2020-07-16 09:57:18 [+0200], Peter Zijlstra wrote:
> 
> there appear to be hardly any users left.. Can't we stage an extinction
> event here instead?

Most of the time the tasklet is scheduled from an interrupt handler. So
we could get rid of these tasklets by using threaded IRQs.

Sebastian


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
