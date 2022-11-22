Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7072F6341B9
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 22 Nov 2022 17:43:30 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1oxWMr-0005Gi-6J
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 22 Nov 2022 16:43:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <gregkh@linuxfoundation.org>) id 1oxWMq-0005GX-Cu
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 22 Nov 2022 16:43:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UEBqU41eaw4Iu2gTJcOWA11cIqE9b5bg/IxV78SP+a0=; b=RT0duTVkid0M/+n6fP0NK6grYx
 c2SwNCel+aqQbif1CAGF8l3Oflsif/G7oMFadGpaxeaT/xHz1aqbIB6NE29s38NRrjcNqgxk7Ersi
 3DpZq+ZzjxqIkv3JIEp7JUeT+jpBhOoIHpMUDC65a2uODv7EUMW7CR5GmTvOpy3p2Uwo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UEBqU41eaw4Iu2gTJcOWA11cIqE9b5bg/IxV78SP+a0=; b=BYA0hNRvq7K2pKOY29OKiiikmY
 JQaQb4IQUYilmxQd72XDP7NmqT6eMgr+OE6/DcwfD4xVN7tK3P39C2TwrOPWOAq678uPVKJVgDl84
 rywkk3Mqg1fyhUWTXG8xnEVDjqfqyQWBZvlnWvY0bRhJT50GundNe6lLHaDLayncID/s=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oxWMi-00CMZ4-4t for kgdb-bugreport@lists.sourceforge.net;
 Tue, 22 Nov 2022 16:43:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A8C9CB81CBD;
 Tue, 22 Nov 2022 16:43:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7CD1C433D6;
 Tue, 22 Nov 2022 16:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1669135392;
 bh=HhGB03f7yfLJTw6SIRqhGxERi9Gom4x4ToervBUNQF8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ai29wCwrSrFMalECnQg3VZFE6JJ7w1PVvNsX/nUcTdZGvwJT9FgVXh0Qu1fP/KZjg
 gLL1mmmGyJUPfkwUZ8U8rfzyORb4k7cg2ocWkdlYVwXPJu4ByDHKX8FbqktGuqI0/r
 L84ihOeSNwOdUyo5JUrjvyIoAUgVxWDKIToY6zCM=
Date: Tue, 22 Nov 2022 17:43:08 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: John Ogness <john.ogness@linutronix.de>
Message-ID: <Y3z8HOt0yOd1nceY@kroah.com>
References: <20221116162152.193147-1-john.ogness@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221116162152.193147-1-john.ogness@linutronix.de>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Nov 16, 2022 at 05:27:12PM +0106, John Ogness wrote:
 > This is v5 of a series to prepare for threaded/atomic > printing. v4 is
 here [0]. This series focuses on reducing the > scope of the BKL [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oxWMi-00CMZ4-4t
Subject: Re: [Kgdb-bugreport] [PATCH printk v5 00/40] reduce console_lock
 scope
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
Cc: linux-fbdev@vger.kernel.org, linux-efi@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Peter Zijlstra <peterz@infradead.org>, kgdb-bugreport@lists.sourceforge.net,
 dri-devel@lists.freedesktop.org, Eric Dumazet <edumazet@google.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Jiri Slaby <jirislaby@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 linux-samsung-soc@vger.kernel.org, Tom Rix <trix@redhat.com>,
 Richard Weinberger <richard@nod.at>, Helge Deller <deller@gmx.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-serial@vger.kernel.org,
 Aaron Tomlin <atomlin@redhat.com>, Miguel Ojeda <ojeda@kernel.org>,
 Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Paolo Abeni <pabeni@redhat.com>, Petr Mladek <pmladek@suse.com>,
 Michal Simek <michal.simek@xilinx.com>, linux-um@lists.infradead.org,
 Steven Rostedt <rostedt@goodmis.org>, linux-m68k@lists.linux-m68k.org,
 Jakub Kicinski <kuba@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, Juergen Gross <jgross@suse.com>,
 Mathias Nyman <mathias.nyman@linux.intel.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, netdev@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Lukas Wunner <lukas@wunner.de>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jason Wessel <jason.wessel@windriver.com>, linux-fsdevel@vger.kernel.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Johannes Berg <johannes@sipsolutions.net>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Wed, Nov 16, 2022 at 05:27:12PM +0106, John Ogness wrote:
> This is v5 of a series to prepare for threaded/atomic
> printing. v4 is here [0]. This series focuses on reducing the
> scope of the BKL console_lock. It achieves this by switching to
> SRCU and a dedicated mutex for console list iteration and
> modification, respectively. The console_lock will no longer
> offer this protection.
> 
> Also, during the review of v2 it came to our attention that
> many console drivers are checking CON_ENABLED to see if they
> are registered. Because this flag can change without
> unregistering and because this flag does not represent an
> atomic point when an (un)registration process is complete,
> a new console_is_registered() function is introduced. This
> function uses the console_list_lock to synchronize with the
> (un)registration process to provide a reliable status.
> 
> All users of the console_lock for list iteration have been
> modified. For the call sites where the console_lock is still
> needed (for other reasons), comments are added to explain
> exactly why the console_lock is needed.
> 
> All users of CON_ENABLED for registration status have been
> modified to use console_is_registered(). Note that there are
> still users of CON_ENABLED, but this is for legitimate purposes
> about a registered console being able to print.
> 
> The base commit for this series is from Paul McKenney's RCU tree
> and provides an NMI-safe SRCU implementation [1]. Without the
> NMI-safe SRCU implementation, this series is not less safe than
> mainline. But we will need the NMI-safe SRCU implementation for
> atomic consoles anyway, so we might as well get it in
> now. Especially since it _does_ increase the reliability for
> mainline in the panic path.
> 
> Changes since v4:
> 
> printk:
> 
> - Introduce console_init_seq() to handle the now rather complex
>   procedure to find an appropriate start sequence number for a
>   new console upon registration.
> 
> - When registering a non-boot console and boot consoles are
>   registered, try to flush all the consoles to get the next @seq
>   value before falling back to use the @seq of the enabled boot
>   console that is furthest behind.
> 
> - For console_force_preferred_locked(), make the console the
>   head of the console list.
> 


Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
