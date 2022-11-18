Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8536B62F399
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 18 Nov 2022 12:23:14 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1ovzSi-0006Kh-1K
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 18 Nov 2022 11:23:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1ovzSh-0006Ka-HK
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 18 Nov 2022 11:23:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8+Mt338auMAPyZ6wHbrxbwJ1oWL2/y5Lq8MjJbkctG8=; b=gJXw7i+aAqkOZGFyVBFVX00TBs
 j+br5Y0wZ0IIEYeulOF0ecAo7c40q09SaFy8rNTVbJRdVKcwrnP7IoL8pl1RGA6Vw9+XcebefHioR
 8fTn3EWuIpgYR1qoh/73Nmbmc/vriTcx93bfVxgkSMyqDTsOGOrLRvmyoy2BOCLAvXk8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8+Mt338auMAPyZ6wHbrxbwJ1oWL2/y5Lq8MjJbkctG8=; b=LWKrmSksuaEkT84kEBKvaL+buB
 l2iBYF4AQvvM0j5pn+Wpzy81e87Sm40qfyrDLsHKRQEQFydLJBiWHgzPLtnnmjr8TlUVslOKuo7Ix
 t7iINBeHOUy8OwU4xJdZc29rwHCCNPEMBYqKqU11sQmXsA/D5+JA6sGjCmooCxOYuJA4=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1ovzSe-00CTpK-ML for kgdb-bugreport@lists.sourceforge.net;
 Fri, 18 Nov 2022 11:23:11 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 24094224B6;
 Fri, 18 Nov 2022 11:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1668770578; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8+Mt338auMAPyZ6wHbrxbwJ1oWL2/y5Lq8MjJbkctG8=;
 b=Mqsids9jdixeoyQ3eEblSjOT6qn2nKBBxnXO4YIV6MczkJIueBfOWf5IH+Qgu5GEThrRT6
 hSgJwbIBgcAARZnSZqZlRalEkqp3F27xcCibtgAVfz9XkwKNyhdLPpWTxITfMMyrMmaYir
 bQTfFlUi5/jqo+/cVb1R0youfVPvkVY=
Received: from suse.cz (unknown [10.100.201.202])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 871B52C141;
 Fri, 18 Nov 2022 11:22:56 +0000 (UTC)
Date: Fri, 18 Nov 2022 12:22:56 +0100
To: John Ogness <john.ogness@linutronix.de>
Message-ID: <Y3drEOkD1fuZcvV2@alley>
References: <20221116162152.193147-1-john.ogness@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221116162152.193147-1-john.ogness@linutronix.de>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed 2022-11-16 17:27:12, John Ogness wrote: > This is v5
 of a series to prepare for threaded/atomic > printing. v4 is here [0]. This
 series focuses on reducing the > scope of the BKL console_lock. [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.28 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1ovzSe-00CTpK-ML
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
From: Petr Mladek via Kgdb-bugreport <kgdb-bugreport@lists.sourceforge.net>
Reply-To: Petr Mladek <pmladek@suse.com>
Cc: linux-fbdev@vger.kernel.org, linux-efi@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Peter Zijlstra <peterz@infradead.org>, kgdb-bugreport@lists.sourceforge.net,
 dri-devel@lists.freedesktop.org, Eric Dumazet <edumazet@google.com>,
 netdev@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>,
 Jiri Slaby <jirislaby@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 linux-samsung-soc@vger.kernel.org, Tom Rix <trix@redhat.com>,
 Richard Weinberger <richard@nod.at>, Helge Deller <deller@gmx.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-serial@vger.kernel.org,
 Aaron Tomlin <atomlin@redhat.com>, Miguel Ojeda <ojeda@kernel.org>,
 Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Paolo Abeni <pabeni@redhat.com>, Michal Simek <michal.simek@xilinx.com>,
 linux-um@lists.infradead.org, Steven Rostedt <rostedt@goodmis.org>,
 linux-m68k@lists.linux-m68k.org, Jakub Kicinski <kuba@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, Juergen Gross <jgross@suse.com>,
 Mathias Nyman <mathias.nyman@linux.intel.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Sergey Senozhatsky <senozhatsky@chromium.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Lukas Wunner <lukas@wunner.de>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jason Wessel <jason.wessel@windriver.com>, linux-fsdevel@vger.kernel.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Johannes Berg <johannes@sipsolutions.net>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Wed 2022-11-16 17:27:12, John Ogness wrote:
> This is v5 of a series to prepare for threaded/atomic
> printing. v4 is here [0]. This series focuses on reducing the
> scope of the BKL console_lock. It achieves this by switching to
> SRCU and a dedicated mutex for console list iteration and
> modification, respectively. The console_lock will no longer
> offer this protection.

The patchset looks ready for linux-next from my POV.

I am going to push it there right now to get as much testing
as possible before the merge window.

Any review and comments are still appreciate. We could always
take it back if some critical problems are discovered and
can't be solved easily.

Best Regards,
Petr


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
