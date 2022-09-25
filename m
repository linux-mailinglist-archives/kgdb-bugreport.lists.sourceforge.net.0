Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7495E93E9
	for <lists+kgdb-bugreport@lfdr.de>; Sun, 25 Sep 2022 17:23:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1ocTU4-00050m-Nf
	for lists+kgdb-bugreport@lfdr.de;
	Sun, 25 Sep 2022 15:23:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <john.ogness@linutronix.de>) id 1ocTU3-00050Y-Dp
 for kgdb-bugreport@lists.sourceforge.net;
 Sun, 25 Sep 2022 15:23:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lYuGfRxRRD8ElWe/MX6vcbHsXtJqzWLNDRr3hQbeYms=; b=aDj5k6xi8NLevRHF3b8eU7vvBS
 DV79MfIMGv/V1C8SwJYI39VzX5lZveNi+USHgNshWgNql+GpttxaneFGKg1obCpjKufrVGXATt8iK
 jJUfnXbvFQ+knZmS6AO8NLFqD96dA+wvY3jA7z12n8RSHUmvT1IWL+3sG3qKD2Xcqhdc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lYuGfRxRRD8ElWe/MX6vcbHsXtJqzWLNDRr3hQbeYms=; b=KKSEeqyNtzIHQCAVlvMMHrVp2E
 eanbZ0BY3C+RzvHfScrkBa2xmEYQTv2TxEVqhg1QGwyU8iHZHAjJDKhwb4lXY7fnsK4OSF/vh/rNb
 u17aG6Ddf4PM85WDVLr8Mg7pThXmwCqXKKHso62A4hCyDZLW/X+JmuUoN6NBSTm9tRps=;
Received: from galois.linutronix.de ([193.142.43.55])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ocTU1-002RoC-Gn for kgdb-bugreport@lists.sourceforge.net;
 Sun, 25 Sep 2022 15:23:55 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1664119422;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lYuGfRxRRD8ElWe/MX6vcbHsXtJqzWLNDRr3hQbeYms=;
 b=4o6/Yi8W8TR3wYtjLafNd4nWDKzlEQ5gkc02I+3sxBfpo+9vezn8sQ19N6+TlWDlvcFoeo
 RFsRvT62TZBgT97wmFthNJKAUVJFU+5Ihq6xusXNWhKXuYjLiOY+vfq8S0q1K3s7Q95lUX
 J7bvje9GBQyCD1rofPDn9fo5Jlz8JpsSPmb2PjYpgTAp4leKgkth0ix2cBy4gFQWIpnCAc
 g/ni0Cr0XwYUTLPmDMCLOQyDKr20tfasmCoAkeq8fdWTqwUMU4hUVefInzz2MW6iYhTgCx
 ZWjQioSQ2Ure1/UJBQvd+vyXD3njCGMVlXy2axBfZ7zb4e3BxjdG+6ZDPlTpnQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1664119422;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lYuGfRxRRD8ElWe/MX6vcbHsXtJqzWLNDRr3hQbeYms=;
 b=H6VsHstNf5MPQfIzMB81iwdLZoKfcg9RiYTwfM9z+i652PjiqjMzynDssmCOuun7W04ekK
 8/JHdHOKiDhav9CA==
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
In-Reply-To: <Yy6nVpd3+yogT5pJ@kroah.com>
References: <20220924000454.3319186-1-john.ogness@linutronix.de>
 <Yy6nVpd3+yogT5pJ@kroah.com>
Date: Sun, 25 Sep 2022 17:29:41 +0206
Message-ID: <87czbj7a0y.fsf@jogness.linutronix.de>
MIME-Version: 1.0
X-Spam-Score: -1.9 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022-09-24,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
 wrote: > These all look great to me, thanks for resending them. > > Do you
 want them to go through my serial/tty tree, or is there some > [...] 
 Content analysis details:   (-1.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.6 INVALID_DATE_TZ_ABSURD Invalid Date: header (timezone does not
 exist)
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [193.142.43.55 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1ocTU1-002RoC-Gn
Subject: Re: [Kgdb-bugreport] [PATCH printk 00/18] preparation for
 threaded/atomic printing
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
Cc: Petr Mladek <pmladek@suse.com>,
 Daniel Thompson <daniel.thompson@linaro.org>, linux-parisc@vger.kernel.org,
 Sven Schnelle <svens@stackframe.org>, Helge Deller <deller@gmx.de>,
 Aaron Tomlin <atomlin@redhat.com>, Julia Lawall <Julia.Lawall@inria.fr>,
 linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>, "James
 E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Luis Chamberlain <mcgrof@kernel.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>, linux-serial@vger.kernel.org,
 Jason Wessel <jason.wessel@windriver.com>, linux-fsdevel@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, John David Anglin <dave.anglin@bell.net>,
 Jiri Slaby <jirislaby@kernel.org>, kgdb-bugreport@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On 2022-09-24, Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:
> These all look great to me, thanks for resending them.
>
> Do you want them to go through my serial/tty tree, or is there some
> other tree to take them through (printk?)

Thanks Greg. but I would prefer they go through the printk tree. In
particular, I want Petr to have the chance to review patches 15-18.

> If they are to go through someone else's tree, feel free to add:
>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Thanks!

John


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
