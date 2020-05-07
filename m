Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C269B1C8E29
	for <lists+kgdb-bugreport@lfdr.de>; Thu,  7 May 2020 16:15:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jWhJ1-0006Kr-Iv
	for lists+kgdb-bugreport@lfdr.de; Thu, 07 May 2020 14:15:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1jWhJ0-0006KW-5E
 for kgdb-bugreport@lists.sourceforge.net; Thu, 07 May 2020 14:15:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5931JdBVqJww8AlSoc9F9FLcx5x8sQNSCU+GdSA9qtk=; b=F8rHBEsYwcV2PGjseSly2sYEwy
 T2Nahf86AaTAe+6j/NQL//2lLWGv0tT6BOqKVIDXBm6B53FRzAgVZXRn4stWmna3JYAZ9m3e7WtPS
 p/Rw88MIztTDZy7r1NBAuT6Q5aprzfKUt2HftA8CHH/A3pMm0tylrPwFt/d8C8bio7ks=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5931JdBVqJww8AlSoc9F9FLcx5x8sQNSCU+GdSA9qtk=; b=VUel6ivlzaqBTbzDVYBHwIT9cY
 VJZrJvSdpi+xqWs2NLHpjRH6cIIO3VKirSH3zW4lR4lKYyedVg59U84MVvpTOO4wpiLVLM9ogLngH
 TTK/DegQX85ndzq90e/mv27QBGYrC6Q53YffvtILPo/k4torw8cJBd+b/VYKwX1APH5w=;
Received: from mail-wr1-f66.google.com ([209.85.221.66])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jWhIt-00EIB9-Iy
 for kgdb-bugreport@lists.sourceforge.net; Thu, 07 May 2020 14:15:18 +0000
Received: by mail-wr1-f66.google.com with SMTP id v12so5268102wrp.12
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 07 May 2020 07:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=5931JdBVqJww8AlSoc9F9FLcx5x8sQNSCU+GdSA9qtk=;
 b=ID4stJ++ymQe2D4Afi9BiGxUGCWV7OtTKyWhzRPG4Vgawh4yn009KaQV7R6QlQR0Pi
 1pxQ4UjH1F9fN9/W6rlx2/qg2gpH0z3CJ6TrcsTEU7oOrAxRF0T8sIaYY/cxmwu7X7aJ
 lrOt5RIEIs3hNsmuq+eeMS5ArHjIkwhRVcQyVNCFSQli2gJaPMH1mVLeZp7villOB+pe
 3dSmZAyLi39OqjMNw3t+nd1DVNokngFQxSfulJcya0Fax3tjRglj5zP5ggTmbRW7GCME
 OODFUt3mRTZKk++uN8wZeGWkqw/QDzBYmKQFgALrqOFJFVUuIGzmxUy4J7YErNRWJgt9
 aoiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5931JdBVqJww8AlSoc9F9FLcx5x8sQNSCU+GdSA9qtk=;
 b=BMrE1E0t+6ScU78ZuKQSEFdVexSu6V2mle2ExKRzRM3SLE2AC7efvVDkVprxMhUmjJ
 e/1tnHy+ScCSDWCcFI7NkrMDSWwkzE4Ev8ULKUYSZ8LecB/lRxHmf85dLAztPzUYwIDA
 mm0u9zU3tplkpo+yAS93W5mdSjkIFFuKMotsNhtuNEigE0J50uQ5aUajKM34okvUemGx
 KiaC53mwwa+ePGg7TjfMRvpwVzf3M5DVAyrQWTAdNNQJ9J5q6yG125DM5cB3899OB3sx
 2lykL4Y5EcDuoKHt7DJQ58NGLhrs+NQfspbbGRepgC19RdI1rgt8GDLSKr1VyJsI3Y7v
 1Pew==
X-Gm-Message-State: AGi0Puala9HCLrzhvv7ehYWsnkUUE5KV2SobnhP8+LvTWH6cucRTZhsG
 D01Gqp0fQg0DpNrhWlsU26q+Ww==
X-Google-Smtp-Source: APiQypJ7NraBcRVZ1UAKnnYq5tZYvr2Hjw7sIJB2ILe5XmowAlEZFKbJXC8o4uuOwUTiILXHN5c4zg==
X-Received: by 2002:adf:fc92:: with SMTP id g18mr16180703wrr.10.1588860896184; 
 Thu, 07 May 2020 07:14:56 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id s8sm8113850wrt.69.2020.05.07.07.14.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 07:14:55 -0700 (PDT)
Date: Thu, 7 May 2020 15:14:53 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Will Deacon <will@kernel.org>
Message-ID: <20200507141453.wjcq4hjfwv3pppex@holly.lan>
References: <20200506164223.2875760-1-daniel.thompson@linaro.org>
 <20200507083929.GC28215@willie-the-truck>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200507083929.GC28215@willie-the-truck>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.66 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.66 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jWhIt-00EIB9-Iy
Subject: Re: [Kgdb-bugreport] [PATCH] kgdb: Fix spurious true from
 in_dbg_master()
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
Cc: kgdb-bugreport@lists.sourceforge.net, patches@linaro.org,
 linux-kernel@vger.kernel.org, Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Thu, May 07, 2020 at 09:39:30AM +0100, Will Deacon wrote:
> On Wed, May 06, 2020 at 05:42:23PM +0100, Daniel Thompson wrote:
> > Currently there is a small window where a badly timed migration could
> > cause in_dbg_master() to spuriously return true. Specifically if we
> > migrate to a new core after reading the processor id and the previous
> > core takes a breakpoint then we will evaluate true if we read
> > kgdb_active before we get the IPI to bring us to halt.
> > 
> > Fix this by checking irqs_disabled() first. Interrupts are always
> > disabled when we are executing the kgdb trap so this is an acceptable
> > prerequisite. This also allows us to replace raw_smp_processor_id()
> > with smp_processor_id() since the short circuit logic will prevent
> > warnings from PREEMPT_DEBUG.
> > 
> > Fixes: dcc7871128e9 ("kgdb: core changes to support kdb")
> > Suggested-by: Will Deacon <will@kernel.org>
> > Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
> > ---
> >  include/linux/kgdb.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/include/linux/kgdb.h b/include/linux/kgdb.h
> > index b072aeb1fd78..4d6fe87fd38f 100644
> > --- a/include/linux/kgdb.h
> > +++ b/include/linux/kgdb.h
> > @@ -323,7 +323,7 @@ extern void gdbstub_exit(int status);
> >  extern int			kgdb_single_step;
> >  extern atomic_t			kgdb_active;
> >  #define in_dbg_master() \
> > -	(raw_smp_processor_id() == atomic_read(&kgdb_active))
> > +	(irqs_disabled() && (smp_processor_id() == atomic_read(&kgdb_active)))
> >  extern bool dbg_is_early;
> >  extern void __init dbg_late_init(void);
> >  extern void kgdb_panic(const char *msg);
> 
> Cheers, Daniel. I assume you'll route this one via the kgdb tree? I can
> live with the "small window" in the arm64 for-next/core branch ;)

Yes. I'll get this one applied very soon (thanks for Doug for the quick
review).


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
