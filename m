Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 76AB25315C2
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 23 May 2022 21:39:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1ntDtm-00054S-Td
	for lists+kgdb-bugreport@lfdr.de; Mon, 23 May 2022 19:39:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <keescook@chromium.org>) id 1ntDtm-00054M-0B
 for kgdb-bugreport@lists.sourceforge.net; Mon, 23 May 2022 19:39:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9i0mf5EWjId+dJhDG42zI0t8gO1U5xR/fPTtg8h/guQ=; b=Y8InpWb+DYZbnct1Ov/S6EBxzp
 en1KVkagrIwwlLcfXizgG7Hj9dC3lGKNnoMqjBReKUfWQoWyKFQP0Q3llXh8bP7eHaLr7Df7fSd5w
 UPoRa+P7SXSsajDgyUBGiZLaWs6XnlEMn0A7VDj67POpac42EfRGQ9DXof1KRtm3mkHY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9i0mf5EWjId+dJhDG42zI0t8gO1U5xR/fPTtg8h/guQ=; b=AiTb+c0SmlA7NzSmk/kWolEBmq
 VMKeHfBn4o09eXAT54z3gLp0RLdL1+T2Z8Ik/vSmXadTQqzGFDD8/Hr5tT50AOcD8z4TLa/CLPQ15
 /5w2EMIbtdgaJiXyzN3JS8VtjtCibk3KuJmeX0L4sHh8wZHpUxfhTUR3nHLOG+PaMO5E=;
Received: from mail-pl1-f170.google.com ([209.85.214.170])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1ntDtg-0000wK-V9
 for kgdb-bugreport@lists.sourceforge.net; Mon, 23 May 2022 19:39:24 +0000
Received: by mail-pl1-f170.google.com with SMTP id b5so6949751plx.10
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 23 May 2022 12:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=9i0mf5EWjId+dJhDG42zI0t8gO1U5xR/fPTtg8h/guQ=;
 b=G67mgEOcbKAzzfRqWT2tyqM6K9pitcq9pbTVcwT0LjmKZNi0oiqVsX8V97hEFwl2hf
 AMnpF3tfbp0thJvNCE4CX5dI4O8ELTGwmxs1K5fhCNP737yCqZGbfIr/xW9c33Xf+LOK
 scdJ+18kS7hWnfRSUS9ItgijmeteaopgZF3uU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9i0mf5EWjId+dJhDG42zI0t8gO1U5xR/fPTtg8h/guQ=;
 b=NpBI4Ex+PnRhyyxDTd3sGAJSeyJaKUXsI0a7sleaqpG2ZNnTuvoc+7aOfQN48xPu/F
 /2nt3lQubaEolalU6n7Yal4hzotauG24iWX3Sh6myr/zqsGQ/k4h/xsINWdYDURirRri
 er0txfH3pm3wr74RoqPT1PgqXJTgoGNkV1PR2TkjXLyqHh1cQWMQW4t+dJl88d5zDuNX
 DOxIsRa/iUbN+H8W94lJiyuEPh2emvg4xF+EO1MGT+1WjxNVFJdmwNXK5TMPg9Wpe80B
 C/0xMrFgtIZu922lGXd7XQgan671/cSe+namxh1fem2PHsTu0V0kwKullWPK1+A9jKpD
 OLpw==
X-Gm-Message-State: AOAM533VWNZkOdwCpImgN/2EVRuxeoocY0bz5TdhhqnEJhV5VPw9U3Cw
 cQ+ZSId57Ad+fJbgCsf6duzcnw==
X-Google-Smtp-Source: ABdhPJwpmlrfLvCqOEAWUHk/iFb9vTBCFvDV+XiSslGuIShWmQMdDaruCMB2aTz4o4uZEjpK38rAug==
X-Received: by 2002:a17:902:f605:b0:14d:9e11:c864 with SMTP id
 n5-20020a170902f60500b0014d9e11c864mr24236615plg.54.1653334755308; 
 Mon, 23 May 2022 12:39:15 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 a9-20020a62bd09000000b0051827128aeasm7543246pff.131.2022.05.23.12.39.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 12:39:14 -0700 (PDT)
Date: Mon, 23 May 2022 12:39:12 -0700
From: Kees Cook <keescook@chromium.org>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <202205231238.FAF6D28@keescook>
References: <CGME20220520083715epcas5p400b11adef4d540756c985feb20ba29bc@epcas5p4.samsung.com>
 <20220520083701.2610975-1-maninder1.s@samsung.com>
 <YonTOL4zC4CytVrn@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YonTOL4zC4CytVrn@infradead.org>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sat, May 21, 2022 at 11:07:52PM -0700, Christoph Hellwig
 wrote: > On Fri, May 20, 2022 at 02:06:56PM +0530, Maninder Singh wrote:
 > > kallsyms functionality depends on KSYM_NAME_LEN directly. > > b [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.170 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.170 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ntDtg-0000wK-V9
Subject: Re: [Kgdb-bugreport] [PATCH 0/5] kallsyms: make kallsym APIs more
 safe with scnprintf
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
Cc: peterz@infradead.org, benh@kernel.crashing.org, linux@rasmusvillemoes.dk,
 linux-kernel@vger.kernel.org, paulus@samba.org, linux-hexagon@vger.kernel.org,
 agordeev@linux.ibm.com, will@kernel.org, linux-s390@vger.kernel.org,
 daniel.thompson@linaro.org, arnd@arndb.de, linux-scsi@vger.kernel.org,
 onkarnath.1@samsung.com, mpe@ellerman.id.au, anil.s.keshavamurthy@intel.com,
 kartilak@cisco.com, kgdb-bugreport@lists.sourceforge.net,
 naveen.n.rao@linux.ibm.com, longman@redhat.com, borntraeger@linux.ibm.com,
 jejb@linux.ibm.com, mhiramat@kernel.org, v.narang@samsung.com,
 pmladek@suse.com, satishkh@cisco.com, boqun.feng@gmail.com, gor@linux.ibm.com,
 hca@linux.ibm.com, rostedt@goodmis.org, linux-fsdevel@vger.kernel.org,
 andriy.shevchenko@linux.intel.com, mingo@redhat.com, bcain@quicinc.com,
 martin.petersen@oracle.com, sebaddel@cisco.com, senozhatsky@chromium.org,
 mcgrof@kernel.org, svens@linux.ibm.com, jason.wessel@windriver.com,
 Maninder Singh <maninder1.s@samsung.com>, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net,
 linux-modules@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Sat, May 21, 2022 at 11:07:52PM -0700, Christoph Hellwig wrote:
> On Fri, May 20, 2022 at 02:06:56PM +0530, Maninder Singh wrote:
> > kallsyms functionality depends on KSYM_NAME_LEN directly.
> > but if user passed array length lesser than it, sprintf
> > can cause issues of buffer overflow attack.
> > 
> > So changing *sprint* and *lookup* APIs in this patch set
> > to have buffer size as an argument and replacing sprintf with
> > scnprintf.
> 
> This is still a pretty horrible API.  Passing something like
> a struct seq_buf seems like the much better API here.  Also with
> the amount of arguments and by reference passing it might be worth
> to pass them as a structure while you're at it.

Yeah, I agree. It really seems like seq_buf would be nicer.

-- 
Kees Cook


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
