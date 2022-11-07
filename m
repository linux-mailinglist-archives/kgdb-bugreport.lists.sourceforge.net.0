Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D4561EF76
	for <lists+kgdb-bugreport@lfdr.de>; Mon,  7 Nov 2022 10:46:06 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1oryhh-0004OC-7A
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 07 Nov 2022 09:46:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <john.ogness@linutronix.de>) id 1oryhD-0004K2-Nt
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 07 Nov 2022 09:45:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=r8Z4Zi1uANBreU8pmHg5GxgTJ8KVuf0bPgW9y6lD8Pk=; b=Eb9fTkHL+KhTD00bFv3GIOEswH
 rWRmziKaEG8esoOw6kT9H7m7vj1y1QeMZpUW3P2Hb57s2n/gU2xpblSGrVtvJhX+HFxQaC5HZl13k
 C62sU11PEtoC3TJev5eedY8wYOclz4/WW4fER/EAfsXQcvSpeNAPc25NM0Hs27Xh1Q/Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=r8Z4Zi1uANBreU8pmHg5GxgTJ8KVuf0bPgW9y6lD8Pk=; b=EyEIHN7RRt/67GOpVrNSfGsPsI
 dhMDqTe28mDfpsi0U/nJ4x36TGtwAkxhV1wUmJtq3x5A2cvyEGpeIkUcpS6paql9GK5408UZerRnH
 Rr8klPFxy3T2DtPqFB7QYD7FxAszIijNUiQDZS912gJEyVimmNw6XH9gB/rDHy0yRCAE=;
Received: from galois.linutronix.de ([193.142.43.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oryh0-0007aI-Lm for kgdb-bugreport@lists.sourceforge.net;
 Mon, 07 Nov 2022 09:45:28 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1667814304;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=r8Z4Zi1uANBreU8pmHg5GxgTJ8KVuf0bPgW9y6lD8Pk=;
 b=ViMCNpcArCVmGhGZmToYhiU7CH8jdvYCPOCpKIjq5QfnEATVb3hQdDi6S6qTSV/2Kw7h+Q
 OdViPMuE4JxyXMipMIPWE0wYqLvjO7yEpyaV6TSYXuoPVSNadVko5LTquik1ZqtTUSTGEd
 bjX8YLv/q8upm4LydNdEMJx/ToubWtcSC/fqD+11Pe7DbXnv0Jt7WWw5507GQcem/MZPGh
 iXQeK/aXH61DFjN3NHbwJ+C/oGqZnPLPObtN6XaV6Jqv0JH63cwPz7Mc9sfIqE8Ozx/6Ll
 122mw92La0GRrntkR+CZqv9o2zU4quvOENjMwrgpP8jXa5MtEEPoVMJwAlS3Lw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1667814304;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=r8Z4Zi1uANBreU8pmHg5GxgTJ8KVuf0bPgW9y6lD8Pk=;
 b=+pOpX581v8MitwoMCwXj5R0Idf95XwqAw037HFjQ/WUPsrAezfzKPtLPXf0dwnN5uD6lAc
 lV7uGAHBobKHaFAA==
To: Petr Mladek <pmladek@suse.com>
In-Reply-To: <Y2jGKnSw02QLecx+@alley>
References: <20221019145600.1282823-1-john.ogness@linutronix.de>
 <20221019145600.1282823-13-john.ogness@linutronix.de>
 <CAD=FV=VFxKL=sOMdhyHrgy2JOtzKJdOe4euwZRRAK7P-rNVjuQ@mail.gmail.com>
 <CAD=FV=WF2S9wQ6uR+VKU4EfDTVd0JnKkuU3Wyfo6P8E_FouebQ@mail.gmail.com>
 <87czagf8hf.fsf@jogness.linutronix.de>
 <87bkpm7kp8.fsf@jogness.linutronix.de> <Y2jGKnSw02QLecx+@alley>
Date: Mon, 07 Nov 2022 10:51:03 +0106
Message-ID: <87cz9z9jz4.fsf@jogness.linutronix.de>
MIME-Version: 1.0
X-Spam-Score: -1.9 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022-11-07, Petr Mladek <pmladek@suse.com> wrote: >> /*
 >> * Hold the console_lock to guarantee that no consoles are > ^^^^^^^^^^^^
 >> * unregistered until the kgdboc_earlycon setup is complete. > [...] 
 Content analysis details:   (-1.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.6 INVALID_DATE_TZ_ABSURD Invalid Date: header (timezone does not
 exist)
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [193.142.43.55 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1oryh0-0007aI-Lm
Subject: Re: [Kgdb-bugreport] [PATCH printk v2 12/38] tty: serial: kgdboc:
 use console_is_enabled()
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
 Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org,
 Sergey Senozhatsky <senozhatsky@chromium.org>, linux-serial@vger.kernel.org,
 Jason Wessel <jason.wessel@windriver.com>,
 kgdb-bugreport@lists.sourceforge.net, Thomas Gleixner <tglx@linutronix.de>,
 Jiri Slaby <jirislaby@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On 2022-11-07, Petr Mladek <pmladek@suse.com> wrote:
>> /*
>>  * Hold the console_lock to guarantee that no consoles are
>               ^^^^^^^^^^^^
>>  * unregistered until the kgdboc_earlycon setup is complete.
>
> My understanding is that this is synchronized by console_list_lock.
> Or do I miss something?

Yes, in the end the comment will say console_list_lock. At this point in
the series, the console_lock is still used. The comment is updated later
(as in patch 34 of the v2 series).

John


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
