Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E42443299
	for <lists+kgdb-bugreport@lfdr.de>; Tue,  2 Nov 2021 17:19:51 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1mhwVq-0006Te-6K
	for lists+kgdb-bugreport@lfdr.de; Tue, 02 Nov 2021 16:19:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <daniel.thompson@linaro.org>) id 1mhwVp-0006TY-7i
 for kgdb-bugreport@lists.sourceforge.net; Tue, 02 Nov 2021 16:19:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CpUJOmzAX/8URtDkwbVdkTj3rb0UDdNphvTprVMTsPc=; b=T8hq++Ix2WTRTFsfATN0m9bbWY
 wRAt5aCex6bcmMQUmFaF5IAYIFU0g/ws5J01EI80EoFkyMcLRMHEyTCZdu35PAnzDdQV1GPQNJbT6
 p1EdzoktPZOmqTW2m459mfHSYD/tsbNSUCxOPgtgPSKZ5woZdbwfsTd1mjg9XVrtll38=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CpUJOmzAX/8URtDkwbVdkTj3rb0UDdNphvTprVMTsPc=; b=Wa5Z5WMh301u7guR+rqaKqDSaJ
 cyDWdzrhLrqEYlxDo65UJSehfd3h6uUd01e/lolEU4cqAqY5HdLUPC8XiGQGvLtY8oEI/hsAct4cN
 ZNL9+ypmX6oMQMrDaWwsuwgrDNs0SHDkIIwVTUDNli5D87xr5KUv9ctE4LLh+XMZzL5o=;
Received: from mail-wr1-f52.google.com ([209.85.221.52])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1mhwVj-00F8vx-Bv
 for kgdb-bugreport@lists.sourceforge.net; Tue, 02 Nov 2021 16:19:49 +0000
Received: by mail-wr1-f52.google.com with SMTP id b12so29724436wrh.4
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 02 Nov 2021 09:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=CpUJOmzAX/8URtDkwbVdkTj3rb0UDdNphvTprVMTsPc=;
 b=A1vwiunFsjHUdX4UhJsd2VuGwcx8879Ito38Bw5Z+CDChY+JvT6+9VdPKIagndQl68
 Og88/XHn4hWv7jPsWEI8vrmL1C/Hc/2mEQ9VdWVEzqdeb3+ZFzYdkKzk8M76yHKf2DGq
 uwGggZzG2onxTwiykA04zouRFH1h+4GfgWU5TC5C2w6RuDpXckcllrNcKsv8M5Mq6Cyp
 X1nmFXPBJO0zVR0TYc5IJ9txNp7kPo+wePNybRPcMKR8W05pyGzsbaxtBE51gquTAzRf
 uFYRs799Vw3j55o5AyaNmxeBvPuUOyKR4QUA0Y04elwgeoKZTwVuBp5mU67wB9ifnjqJ
 Lb+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CpUJOmzAX/8URtDkwbVdkTj3rb0UDdNphvTprVMTsPc=;
 b=p1fXkJeATXctXgT7mWg2tq1OUepwZ7JNdPjRcWoUIT2ikQKCeY8k8ECKtltrtvgyQY
 gioah9N+Ilz4rcTgAfqYUhjaDYCM+4RgAQm97FP+JI1jZd+2dAeb4YKZ+bd4e3+Jdbfx
 wDC5vEN+c4FEBC/2gRnf+v+qF5jyNmhT2uA95wn4I+eCU87DUBw4hxXv+mXch3yNa+7T
 TK0bDWX1YcM2RexC/AshD81USBJI0mt22hKPwgfCUOHgpoyVbLND7VmxukETdaaiqqWI
 d1Q3NhPPiVSTl8MLV/ThkiTZEC96C/EzfU99eWy+pUWaXBTQ83HDR27y4qwaf4NNjJUz
 6+Fw==
X-Gm-Message-State: AOAM533GzAbpmKSMe1u9I4BvtlzlWUs3C0H8c7AwzbH5kabrR91b+Vzc
 SeH//dk6eu33oAoie9i/JwUCCQ==
X-Google-Smtp-Source: ABdhPJw22Mzzh+DNq9uyjKZ8BMu4fdbemenrQaeiEJsRrbU74XvHd0S+P3XM7QQdIkcWoYevFjDbpQ==
X-Received: by 2002:a5d:64c8:: with SMTP id f8mr49212985wri.398.1635869976925; 
 Tue, 02 Nov 2021 09:19:36 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id n184sm1327774wme.2.2021.11.02.09.19.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 09:19:36 -0700 (PDT)
Date: Tue, 2 Nov 2021 16:19:34 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Doug Anderson <dianders@chromium.org>
Message-ID: <20211102161934.664jrypn5rxaszae@maple.lan>
References: <20211101174344.3220974-1-daniel.thompson@linaro.org>
 <CAD=FV=VVV4n4sDziWRbY517Eb8mRJVxwH+ggxf37FXfYKiTJ6A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD=FV=VVV4n4sDziWRbY517Eb8mRJVxwH+ggxf37FXfYKiTJ6A@mail.gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Nov 01, 2021 at 12:56:13PM -0700,
 Doug Anderson wrote: > Hi, > > On Mon, Nov 1,
 2021 at 10:44 AM Daniel Thompson > <daniel.thompson@linaro.org>
 wrote: > > diff --git a/kernel/debug/kdb/kdb_bt. [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.221.52 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.52 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1mhwVj-00F8vx-Bv
Subject: Re: [Kgdb-bugreport] [PATCH v3] kdb: Adopt scheduler's task
 classification
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
Cc: Xiang wangx <wangxiang@cdjrlc.com>,
 jing yangyang <jing.yangyang@zte.com.cn>, kgdb-bugreport@lists.sourceforge.net,
 Patch Tracking <patches@linaro.org>, LKML <linux-kernel@vger.kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Mon, Nov 01, 2021 at 12:56:13PM -0700, Doug Anderson wrote:
> Hi,
> 
> On Mon, Nov 1, 2021 at 10:44 AM Daniel Thompson
> <daniel.thompson@linaro.org> wrote:
> > diff --git a/kernel/debug/kdb/kdb_bt.c b/kernel/debug/kdb/kdb_bt.c
> > index 1f9f0e47aeda..3368a2d15d73 100644
> > --- a/kernel/debug/kdb/kdb_bt.c
> > +++ b/kernel/debug/kdb/kdb_bt.c
> > @@ -74,7 +74,7 @@ static void kdb_show_stack(struct task_struct *p, void *addr)
> >   */
> >
> >  static int
> > -kdb_bt1(struct task_struct *p, unsigned long mask, bool btaprompt)
> > +kdb_bt1(struct task_struct *p, const char *mask, bool btaprompt)
> 
> (Copied from v1 review):
> 
> In the comment above this function there is still a reference to
> "DRSTCZEUIMA". Update that?

/me slaps head

Sorry. This patch really doesn't seem to have been my finest hour.
Really thought I'd got it right at v3 (even threw in extra manual
testing for good measure).

Will fix... immediately.


> > @@ -2271,37 +2271,30 @@ static int kdb_cpu(int argc, const char **argv)
> >  void kdb_ps_suppressed(void)
> >  {
> >         int idle = 0, daemon = 0;
> > -       unsigned long mask_I = kdb_task_state_string("I"),
> > -                     mask_M = kdb_task_state_string("M");
> >         unsigned long cpu;
> >         const struct task_struct *p, *g;
> >         for_each_online_cpu(cpu) {
> >                 p = kdb_curr_task(cpu);
> > -               if (kdb_task_state(p, mask_I))
> > +               if (kdb_task_state(p, "-"))
> >                         ++idle;
> >         }
> >         for_each_process_thread(g, p) {
> > -               if (kdb_task_state(p, mask_M))
> > +               if (kdb_task_state(p, "ims"))
> >                         ++daemon;
> >         }
> >         if (idle || daemon) {
> >                 if (idle)
> > -                       kdb_printf("%d idle process%s (state I)%s\n",
> > +                       kdb_printf("%d idle process%s (state -)%s\n",
> >                                    idle, idle == 1 ? "" : "es",
> >                                    daemon ? " and " : "");
> >                 if (daemon)
> > -                       kdb_printf("%d sleeping system daemon (state M) "
> > +                       kdb_printf("%d sleeping system daemon (state [ism]) "
> 
> super nitty: elsewhere you use "ims", not "ism". Can you be consistent
> and change the above to "ims"?

Ack.


>  @@ -2742,8 +2743,8 @@ static kdbtab_t maintab[] = {
> >         },
> >         {       .name = "bta",
> >                 .func = kdb_bt,
> > -               .usage = "[D|R|S|T|C|Z|E|U|I|M|A]",
> > -               .help = "Backtrace all processes matching state flag",
> > +               .usage = "[<state_chars>|A]",
> > +               .help = "Backtrace all processes matching whose state matches",
> 
> "matching whose state matches" sounds odd. Clean it up and use the
> saved chars to document "A":
> 
> .help = "Backtrace all processes whose state matches (A=all)",

Turns out we don't have enough characters to document A on an 80
character terminal (some of the other help text is too long as well but
I'll put that on the list for later).

Will settle for "Backtrace all processes whose state matches" and leave
it at that.

Will also updates the .usage for ps which doesn't use the <state_chars>.


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
