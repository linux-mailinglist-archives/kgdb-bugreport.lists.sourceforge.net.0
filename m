Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ACE360CFC7
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 25 Oct 2022 17:00:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1onLPK-0006Sg-QE
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 25 Oct 2022 14:59:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1onLPC-0006SU-5H
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 25 Oct 2022 14:59:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0OnjWi2pdEy4n7cmfWwSconN2E9bcsinJA3k/vOB3j8=; b=fmjh1UnMzjX244riB+z6mNv/RC
 xT7fZdbgtPuF7/BrQoo/d2938OM+t00E95ofVdLU7cfbplvc+BIzYglbtspfPkaDmsTAN63qrJvTV
 daru9Ot2IaqXY+mXDfgwBoTNp3CBwJ/on8tEyDjAd+U1RTNS8T3tVY/GMKuS46/YSnVs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0OnjWi2pdEy4n7cmfWwSconN2E9bcsinJA3k/vOB3j8=; b=fDidboHky6E1SNYOFgar3nSn1z
 Xyd6flpda7xTxccGRgTDQPZ0qj6EvRibLQVZSrBHaEeYH5+oMN7Ye2CBrNEKn+wvS8/ZgIdvWR/4E
 LWTAivzy+A3NGTSIM+ucAgVosOhbtTCqTX9jGXsaeBPt0OHBYm/rbEJ1E43VP8/8Y8oE=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1onLPB-0001GE-B7 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 25 Oct 2022 14:59:50 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 0E04B21FEE;
 Tue, 25 Oct 2022 14:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1666709983; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0OnjWi2pdEy4n7cmfWwSconN2E9bcsinJA3k/vOB3j8=;
 b=Bi1oUHuhLNJkMqAAT63Md2prAKktFZVVGkXOzu9qROi0Bdaf1vvw5UL4KVunD3eEI5jq6f
 GHfIq5RXCZz68W80UEQ6EKYzDtPI/GLOX14CT77FWtITKpe8z0dmgwg7dlu6sUMU+Gsbht
 Zs8XwXnA11RSgttxqYJBtCOJC+LxFLs=
Received: from suse.cz (unknown [10.100.208.146])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 9F55D2C141;
 Tue, 25 Oct 2022 14:59:42 +0000 (UTC)
Date: Tue, 25 Oct 2022 16:59:42 +0200
To: Doug Anderson <dianders@chromium.org>
Message-ID: <Y1f53hZkpyAgfz7/@alley>
References: <20221019145600.1282823-1-john.ogness@linutronix.de>
 <20221019145600.1282823-27-john.ogness@linutronix.de>
 <CAD=FV=U3BSOxDV6VKsEfFUdMTzuJr_VSL9GdvqnxN6qJ8tuW=w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD=FV=U3BSOxDV6VKsEfFUdMTzuJr_VSL9GdvqnxN6qJ8tuW=w@mail.gmail.com>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon 2022-10-24 17:47:25, Doug Anderson wrote: > Hi, > >
 On Wed, Oct 19, 2022 at 7:56 AM John Ogness <john.ogness@linutronix.de> wrote:
 > > > > Guarantee safe iteration of the console list by using [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.28 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1onLPB-0001GE-B7
Subject: Re: [Kgdb-bugreport] [PATCH printk v2 26/38] kdb: use srcu console
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
 John Ogness <john.ogness@linutronix.de>, kgdb-bugreport@lists.sourceforge.net,
 Aaron Tomlin <atomlin@redhat.com>, linux-kernel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Luis Chamberlain <mcgrof@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Mon 2022-10-24 17:47:25, Doug Anderson wrote:
> Hi,
> 
> On Wed, Oct 19, 2022 at 7:56 AM John Ogness <john.ogness@linutronix.de> wrote:
> >
> > Guarantee safe iteration of the console list by using SRCU.
> >
> > Signed-off-by: John Ogness <john.ogness@linutronix.de>
> > ---
> >  kernel/debug/kdb/kdb_io.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
> > index 550fe8b456ec..5c0bd93c3574 100644
> > --- a/kernel/debug/kdb/kdb_io.c
> > +++ b/kernel/debug/kdb/kdb_io.c
> > @@ -545,6 +545,7 @@ static void kdb_msg_write(const char *msg, int msg_len)
> >  {
> >         struct console *c;
> >         const char *cp;
> > +       int cookie;
> >         int len;
> >
> >         if (msg_len == 0)
> > @@ -558,7 +559,8 @@ static void kdb_msg_write(const char *msg, int msg_len)
> >                 cp++;
> >         }
> >
> > -       for_each_console(c) {
> > +       cookie = console_srcu_read_lock();
> > +       for_each_console_srcu(c) {
> 
> Maybe it wouldn't hurt to also have a comment saying that normally the
> console_srcu_read_lock() wouldn't be enough given that we're poking
> into each individual console and calling ->write() but that we're
> relying on the fact that all the other CPUs are stopped at the moment
> and thus we should be safe.

True. I guess that the SRCU lock is not really needed from the same
reason.

Well, the SRCU walk makes sense. It makes sure that the list can be
safely traversed. I mean that pointers are updated and read in
the right order with the right barriers.

Yes, it would be nice to add a comment.

Best Regards,
Petr


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
