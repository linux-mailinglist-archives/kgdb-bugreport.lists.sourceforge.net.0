Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 984535F0CA6
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 30 Sep 2022 15:45:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1oeGK6-0002WO-BK
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 30 Sep 2022 13:45:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <john.ogness@linutronix.de>) id 1oeGK5-0002WH-4G
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 30 Sep 2022 13:45:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1OZgTaBWEcaQzJ86Oz30/kJlR6az74vxKOsEdbTFAX8=; b=mnLs8CtFGUiI9ZabvNvI4CRqsI
 2Gw7qU8xxBARn/IEfmSQ+/6FfDKX2r6mXrAOen+4qt8KPOsPnFXsRuNbw0iYeVz4+KUn6Bh3buv7I
 wuSEV9ZSvedQJTwE7RYoFr1RFMjL7x1MDGS3iUU6baWldNE4Bp4cfADniPOJlT6v5w+I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1OZgTaBWEcaQzJ86Oz30/kJlR6az74vxKOsEdbTFAX8=; b=Nuj7wigjp1L4dzEGLIa1kVDLPu
 U65Ox0RGXaetD2mMgLmJPFCE06FO63iRqkQbngwULQvDxgZwmDMhI5mbhHhaCdgUx/UGJ2aMaNVxj
 slfHtirzo7KeHzijueOkmDGu8ZfkfTa94INcZ6Rkpfg3WYJYDjfnMGVZ4zHFWfJZdPVE=;
Received: from galois.linutronix.de ([193.142.43.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oeGKC-0008H6-Ne for kgdb-bugreport@lists.sourceforge.net;
 Fri, 30 Sep 2022 13:45:13 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1664545497;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1OZgTaBWEcaQzJ86Oz30/kJlR6az74vxKOsEdbTFAX8=;
 b=A0hH8MBaojWkXd5MBGXcx223TV1FAeFKbsOV7KO33rF8lOh1R+g+timvuUZRci0tjKOY/6
 4WSp5XDEnq9s8dmyh+lD4UgBe99oiQSBnJlWTBSpQlP+hL5f3f56XQkhA5Gek+yaXvQMA4
 1ex1ZtEifGPYeytDCd4vKMK5at2db6tQwsJHHdlEQyR2gne4qMw8O6/LR6GVoi4FZVrdHr
 3MlN0xXdJ8Ws8yxf8Gy7X5I2Ka6Bh+EENVAln4K8v7CJxi1go+y5n3YRllExpunejo1OfM
 n9PfbjD5wmnFsp2oP6ZXz/CRyhz72AXZx31Vz+3jdKFEMg4vaOShZP2SI84mbA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1664545497;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1OZgTaBWEcaQzJ86Oz30/kJlR6az74vxKOsEdbTFAX8=;
 b=ml64D/XgKJ0aKgPtgkwESGaanTx5W5HjeWZ6FbPWgTg4fCFqFLXodxONMIjY2+soQIrz7R
 yMn32SAGpGeSqyBw==
To: Petr Mladek <pmladek@suse.com>, Doug Anderson <dianders@chromium.org>
In-Reply-To: <YzarXlj1NyFGTC08@alley>
References: <20220924000454.3319186-1-john.ogness@linutronix.de>
 <20220924000454.3319186-11-john.ogness@linutronix.de>
 <CAD=FV=U3m_mVLpWna3pgi4=b7OCzUxmKh666g62zPNaB+6QHUA@mail.gmail.com>
 <YzarXlj1NyFGTC08@alley>
Date: Fri, 30 Sep 2022 15:50:56 +0206
Message-ID: <87o7uxugbr.fsf@jogness.linutronix.de>
MIME-Version: 1.0
X-Spam-Score: -1.9 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022-09-30, Petr Mladek <pmladek@suse.com> wrote: > Anyway,
 what about using the later added SRCU walk here? > After all, this is exactly
 what RCU is for, isn't it? So I think a lot of the problems with this series
 is that SRCU is introduced too late. We are debating things in patch 6 that
 are irrelevant by patch 12. 
 Content analysis details:   (-1.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.6 INVALID_DATE_TZ_ABSURD Invalid Date: header (timezone does not
 exist)
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linutronix.de]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [193.142.43.55 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1oeGKC-0008H6-Ne
Subject: Re: [Kgdb-bugreport] [PATCH printk 10/18] kgbd: Pretend that
 console list walk is safe
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Aaron Tomlin <atomlin@redhat.com>, LKML <linux-kernel@vger.kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Luis Chamberlain <mcgrof@kernel.org>, linux-serial@vger.kernel.org,
 Jason Wessel <jason.wessel@windriver.com>,
 kgdb-bugreport@lists.sourceforge.net, Thomas Gleixner <tglx@linutronix.de>,
 Jiri Slaby <jirislaby@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On 2022-09-30, Petr Mladek <pmladek@suse.com> wrote:
> Anyway, what about using the later added SRCU walk here?
> After all, this is exactly what RCU is for, isn't it?

So I think a lot of the problems with this series is that SRCU is
introduced too late. We are debating things in patch 6 that are
irrelevant by patch 12.

I will rework the series so that the changes come in the following
order:

1. provide an atomic console_is_enabled()

2. convert the list to SRCU

3. move all iterators from console_lock()/console_trylock() to SRCU

Step 3 may result in console_lock()/console_trylock() calls disappearing
or relocating to where they are needed for non-list-synchronization
purposes.

John


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
