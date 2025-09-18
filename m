Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7014DB84BA8
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 18 Sep 2025 15:02:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z/+FBynpcFaN3CnGpcEaDrSqx4WBvDcPfxgcZOMLBXQ=; b=KZ3nIxbRY7bt+stP0gN08u2KFD
	PPRyRWd1bzMf5PyUe0+mDfNNLr3POmX/X1fMAaNnHslLhgNalgAj7wlggrYQ1eLi+JsIbhx3fSkP3
	nmu8JxI6TYS99AAOAEuX320ueG1XEg4hNS2u4gCKFwu0ZMOx3zUdE88mX+10KQFci92w=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1uzEHZ-000186-HF
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 18 Sep 2025 13:02:42 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1uzEHX-00017r-QA
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 18 Sep 2025 13:02:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aIzDbyhYpuaBXUrKMka7lKnhRt47H5xyoFzXDbV9fD0=; b=kBbE0MxH+3A0ME+Ss03BcbAqde
 m8YbL+43opPyFQdtA8yMn9W1HcBew8AoJLKsbss2mSkhXPXssTbLh9XOV1yt9z2DqhanB9MyTTsmt
 q3jCnI08UVyStpiH0gpG5a2OcL/mvu5tVyITAv06DQ6zaEmAK7lj3FuEKAf8dW5AXY0M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=aIzDbyhYpuaBXUrKMka7lKnhRt47H5xyoFzXDbV9fD0=; b=DIpX60rve8ADj29NhZEAOPHFD8
 LKQBVTkdLizrINs8rbaRh5gT9b5+c5azo2TOv4Lr28/Zye7vr2llZ4zmG0ieadkJM60BuUylacR4H
 hGqfV2LLjkagZGCnumBiHCRRveVZj5agLbam4ayd0+7P1bD/0WaUfpilu/wwqGojYcME=;
Received: from mail-ej1-f65.google.com ([209.85.218.65])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uzEHW-0002R3-Le for kgdb-bugreport@lists.sourceforge.net;
 Thu, 18 Sep 2025 13:02:39 +0000
Received: by mail-ej1-f65.google.com with SMTP id
 a640c23a62f3a-b07d4d24d09so164383066b.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 18 Sep 2025 06:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1758200547; x=1758805347; darn=lists.sourceforge.net; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=aIzDbyhYpuaBXUrKMka7lKnhRt47H5xyoFzXDbV9fD0=;
 b=P+iP5DgCqSTsPsa7A5rhn/0rEW7qf7nUhlby50T4pesttAEot76EhmErOsmGITT92s
 gMls3T4FnLr4Ng/KAdrTumrccKqADTl1ZliOjK9pGjwqYcR42SpY+WCk+AOti2uUvE0z
 PcxTKJyTxeTX/2tcGllbBKOLzrpArlFt9YteYytZX+Z78Ocqw00/794Kdpxf6/G4fBa0
 vL+O5m46NfbxdWSJFWIfuPV71UBvGFX6PzHQQoRSejp8rZbL8aiznVs4D4AR93qr7PDf
 ELOH9H/qJXiIwGXGwS5CkWW1D8Idd0EprLR11t7cPBiqrPnPi7YPoV7czPjSY0NtSq4d
 8OAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758200547; x=1758805347;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aIzDbyhYpuaBXUrKMka7lKnhRt47H5xyoFzXDbV9fD0=;
 b=W1HV9700Vb2XYm7mMmnJa2G/13d7ga3JdHL9V3ppryB7V6vdj9Nj5nAyglI3DbN5LE
 j8lBBzb1OdZJxF11vIWQT0qi7c1WQrNbXcZWmDwZS1a07GWJ8qPxIMGLX2ZDiQ6/wDFg
 HjL8RBG5SpeY3m8ZONaXjMTLQUhPQw0uAB8RmacvMH4MN4RFUdRGaMRhUCoMqazWKxvd
 Ei3axlV73a8Skt6bmbd88L7C1ZWTHNhNPO8stO/3dkGdf1xouNY8Av+y4/E8P2aJvC/U
 QHvCzU9gKbN5LcKS4Qn4+eQk0i4ubkZwoR5y8f1KCOvAOskmiy1/WkJCs47My/+Puz+i
 WLtA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXgxwq4S6KllcnVCetnBfyahWaxG5oH7DO63tGNxLAdrq8NrbIV3jhPkpnZBxxODAM65ta9v6BDmqtvKVSBxA==@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyuZ9T5bb5UuMkOT/OiBAghQFjd2AQe/o+9/Q0xaSBKsGF0lkXF
 baKamxK8eYnESvLoCH1j5f5Hs8pP+BaOPze0tnoSNl1gFriD8tudf7pvw9YHSkEQdlk=
X-Gm-Gg: ASbGncueD+FAIa/4xcKqZlkFth+9ps9zx9gxjopdo7LeT36cE9PFf2sRrFOhPLj+2wC
 AxmVGDi81F7b53KGrxULbNpnylOXLgJGqMskRAV6oBDoaDprg/401KvWunOTz5jGkrlHvdYZlhr
 qXCI4LPNfic8lGp1/GCYv9t3OlOc4hAbnKXwjbgrkc4UiQ/4j9W3yZzwtysczQWC7YsjV58MOm6
 IwfTSzhMYhAo1gKlfe7/wgA4daidrVvILeZJRtPWhaEA2QB6uSFpsDxu1C9n95hUN6HC57q5oSl
 ZFNP8muq3bVRRoz9TPKpq0I8KC7z7hvuqsM3B+RTILAJqjPSHe6cHY6LvlvlpVp9GIzXSevd2YB
 pUDgAkwBag1qAiMI30b30wHZ5OjXJMoY2G3TuST7Sw0UT
X-Google-Smtp-Source: AGHT+IE4mI2rDB6qnxX4AnK+7Sl4B8jgUrUQKivo/eG6grifwlwBSBfvXGxUWSy1bqE3hTsahdhF/w==
X-Received: by 2002:a17:907:9604:b0:b0a:aa7e:a191 with SMTP id
 a640c23a62f3a-b1bbb733fc4mr655010666b.57.1758200546741; 
 Thu, 18 Sep 2025 06:02:26 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-62fa5d437b1sm1427249a12.22.2025.09.18.06.02.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Sep 2025 06:02:26 -0700 (PDT)
Date: Thu, 18 Sep 2025 15:02:24 +0200
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Message-ID: <aMwC4HAYjpWpZDMj@pathway.suse.cz>
References: <20250915-nbcon-kgdboc-v4-0-e2b6753bb566@suse.com>
 <20250915-nbcon-kgdboc-v4-1-e2b6753bb566@suse.com>
 <aMp4BrEpqXOW9nam@pathway.suse.cz>
 <dad15813cfdc3b7c77ba71266e38a137d0015bcd.camel@suse.com>
 <20250917-imaginary-vigorous-condor-fccdc1@lemur>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250917-imaginary-vigorous-condor-fccdc1@lemur>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed 2025-09-17 10:07:47, Konstantin Ryabitsev wrote: >
 On Wed, Sep 17, 2025 at 09:21:48AM -0300, Marcos Paulo de Souza wrote: > >
 > Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com> > > > R [...]
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.218.65 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1uzEHW-0002R3-Le
Subject: Re: [Kgdb-bugreport] [PATCH v4 1/5] printk: nbcon: Export
 console_is_usable
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
Cc: John Ogness <john.ogness@linutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Marcos Paulo de Souza <mpdesouza@suse.com>,
 Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Daniel Thompson <danielt@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 kgdb-bugreport@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Wed 2025-09-17 10:07:47, Konstantin Ryabitsev wrote:
> On Wed, Sep 17, 2025 at 09:21:48AM -0300, Marcos Paulo de Souza wrote:
> > > Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
> > > Reviewed-by: Petr Mladek <pmladek@suse.com>
> > > 
> > > It means that Macros developed a patch and Petr reviewed it.
> > > The patch was not longer modified.
> 
> That's not entirely correct. The signed-off trailer is used as the boundary
> indicating who was the person responsible for collecting the trailers. When
> the trailers are collected by the original author as part of their iteration
> cycles, their signed-off-by trailer goes below any trailers they have
> received.

This is an interesting interpretation. I am just curious. Has this
already been discussed anywhere, please?

It seems that the ordering of the trailers is not much described
in the process documentation, see
https://docs.kernel.org/process/submitting-patches.html

Best Regards,
Petr


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
