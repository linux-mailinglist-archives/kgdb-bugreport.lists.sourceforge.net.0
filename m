Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E31D5622F0D
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  9 Nov 2022 16:28:13 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1osmzs-0005Fx-Lr
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 09 Nov 2022 15:28:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1osmzs-0005Fq-2D
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 09 Nov 2022 15:28:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=V1+Ulj90x4+D/oPVdeVQI6aglYv6ToQZfDYujvKSNLQ=; b=SBBJEHGcYprHrhSpvgYDiP5L1i
 Ir7gmtdYxSyhB/GeI5H6CK9JqsQW8fWpcUfj6ugcIn0Z2ilWRfVu7US+Rilhk/Ok9azNqvdt4Qt9p
 rBNyrm+uSjKAknVo2fLt/mSJwjLdGOmooDgmORXPP+8Y/WvrucniJxwyuKsGqmih6qDI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=V1+Ulj90x4+D/oPVdeVQI6aglYv6ToQZfDYujvKSNLQ=; b=jurzWqyJ6Ci/f5u6emoYA4Tl93
 P8x1+pkY2BS3b1kZ2eYucLWMu8mc/SsHI0eQCm1ftz3Lx/HH6CuAEQ5oVYhPx8o39q8ldHAidR2zk
 ej7F8TKmsNMH78MQ9+gICJvgCZubcL+wn0W4eSCyoZ8aTyxiW7P4rhkoXEsnhp6O4qCI=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1osmzY-00041P-Gz for kgdb-bugreport@lists.sourceforge.net;
 Wed, 09 Nov 2022 15:27:58 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id ED10F22A0E;
 Wed,  9 Nov 2022 15:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1668007664; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=V1+Ulj90x4+D/oPVdeVQI6aglYv6ToQZfDYujvKSNLQ=;
 b=uD+6JYMINwOV2Vm5q0jNPmVCJfHu73njXxbn3VTkihNixa9TCw4tv5hVaIxKroOZTEf08c
 hBJ5Dyi0OlaIjplZmjXckAWIBC8mzfoYe/USosGmfTzAhf94VRgyj7Ozn81iLrtSdlPbnd
 gRmV+f8jN/L+0CPr84wtM+80KHmDm6I=
Received: from suse.cz (unknown [10.100.201.202])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id A987C2C141;
 Wed,  9 Nov 2022 15:27:44 +0000 (UTC)
Date: Wed, 9 Nov 2022 16:27:44 +0100
To: John Ogness <john.ogness@linutronix.de>
Message-ID: <Y2vG8KZXBiw2TDLl@alley>
References: <20221107141638.3790965-1-john.ogness@linutronix.de>
 <20221107141638.3790965-16-john.ogness@linutronix.de>
 <20221109085325.wiub564iqnewvczb@ash.lan>
 <87wn848okk.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87wn848okk.fsf@jogness.linutronix.de>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed 2022-11-09 10:33:55, John Ogness wrote: > Hi Daniel, 
 > > On 2022-11-09, Daniel Thompson <daniel.thompson@linaro.org> wrote: >
 >> + /* > >> + * The console_srcu_read_lock() only provides safe co [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.28 listed in list.dnswl.org]
X-Headers-End: 1osmzY-00041P-Gz
Subject: Re: [Kgdb-bugreport] [PATCH printk v3 15/40] kdb: use srcu console
 list iterator
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 kgdb-bugreport@lists.sourceforge.net, Aaron Tomlin <atomlin@redhat.com>,
 linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Luis Chamberlain <mcgrof@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Wed 2022-11-09 10:33:55, John Ogness wrote:
> Hi Daniel,
> 
> On 2022-11-09, Daniel Thompson <daniel.thompson@linaro.org> wrote:
> >> +	/*
> >> +	 * The console_srcu_read_lock() only provides safe console list
> >> +	 * traversal. The use of the ->write() callback relies on all other
> >> +	 * CPUs being stopped at the moment and console drivers being able to
> >> +	 * handle reentrance when @oops_in_progress is set. (Note that there
> >> +	 * is no guarantee for either criteria.)
> >> +	 */
> >
> > The debugger entry protocol does ensure that other CPUs are either
> > stopped or unresponsive. In the case where the other CPU is unresponsive
> > (e.g. timed out after being asked to stop) then there is a "real" printk()
> > issued prior to any of the above interference with the console system to
> > the developer driving the debugger gets as much clue as we can offer them
> > about what is going on (typically this is emitted from regular interrupt
> > context).
> >
> > Given this comment is part of the debugger code then for the
> > oops_in_progress hack it might be more helpful to describe what
> > the developer in front the debugger needs to do to have the most
> > reliable debug session possible.
> >
> >   There is no guarantee that every console drivers can handle reentrance
> >   in this way; the developer deploying the debugger is responsible for
> >   ensuring that the console drivers they have selected handle reentrance
> >   appropriately.
> 
> Thanks for the explanation. I will change the comment to:
> 
> 	/*
> 	 * The console_srcu_read_lock() only provides safe console list
> 	 * traversal. The use of the ->write() callback relies on all other
> 	 * CPUs being stopped at the moment and console drivers being able to
> 	 * handle reentrance when @oops_in_progress is set.
> 	 *
> 	 * There is no guarantee that every console driver can handle
> 	 * reentrance in this way; the developer deploying the debugger
> 	 * is responsible for ensuring that the console drivers they
> 	 * have selected handle reentrance appropriately.
> 	 */

Looks good to me.

After merging this with the 10th patch that adds the data_race() annotated
check of CON_ENABLED flag:

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
