Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0A7B4598C
	for <lists+kgdb-bugreport@lfdr.de>; Fri,  5 Sep 2025 15:49:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gs+3vY70KjBlWvRIlaL645PkVeZVEL7L5sdeV4P33Ek=; b=QEut4rjPGK0VNeX2r/Wy/vdRJs
	GpUrIqyOMaLnK3cUJ6zlMorbTpe8+zXYY63xDdXgrpEFEM5e+t5LMHWerSYCaFom4CVO1xDYETGqC
	OD1bOYjIDMGfC8JcSjESGW0DV9S6arJFRge3OpJsaxGeBOkUIavx40d81QqevPDuYQqY=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1uuWoS-00061o-05
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 05 Sep 2025 13:49:12 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1uuWoQ-00061g-N4
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 05 Sep 2025 13:49:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ohGQSMKwVj1UObMGtjXFeVfLrCd5JxxmvFAFzhxErEY=; b=L46rre54u+ozuEKkGojz8ZXbyP
 dabbbqhCrkB24bGQehtaUNr3Db5ouYOzSC8PC7nsmh0Bwg00rzIeSe+f3b2UV2YZrPRWcpOP/vM0v
 dOARhdYcZbiSm0tGFEQDeze0wageC1Kn3KbUhskyzqO6Rd3kBWXS2pWzNU3AeNN4CFy8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ohGQSMKwVj1UObMGtjXFeVfLrCd5JxxmvFAFzhxErEY=; b=bmyGyDXZvdBD9S6omlEHEC5yQK
 pEkwBuBURj9t3R+JWX2+zmI8Uo5Xng5tUKSP0w+kFENA5pH1rTk0DtPZEOvIIAZWjZaUS53b89ILD
 wvFIo1XSZ2Z9o8rvwAMug7vwUqF/vg4bEHwrt2ZJu4cIeuPU1eDyQpoyznece8F5x7xU=;
Received: from mail-ed1-f48.google.com ([209.85.208.48])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uuWoQ-0001Dl-0L for kgdb-bugreport@lists.sourceforge.net;
 Fri, 05 Sep 2025 13:49:10 +0000
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-61ce9bcc624so2959952a12.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 05 Sep 2025 06:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1757080138; x=1757684938; darn=lists.sourceforge.net; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ohGQSMKwVj1UObMGtjXFeVfLrCd5JxxmvFAFzhxErEY=;
 b=UtBgLTvwJUfxo+Dw0NeISE97zOBKzx0vDVDm1Azd2vnjlqwRpdQXPOxdZAQVDvMXxS
 c1LxFjlfuF34ItedlEak5i5Nrh3yB9ne23pcLz8DvNqE4hCgsb7bYDrwHO9+lg/qk9y/
 BcpmJRtOaRmIsoNPpsdw/uoVwgxEITcAHGKkxzptOwEbyWLsazHY4xnX54s/OLIw0/2p
 AjEQZZ2NrH1Fr+7Cune9vpIHSU/kd0TsZmNENgI9zVAdy2iloO/sM1ZVRgkNl5fJK/lm
 6Y1OeFe2IPL5xe+7lQ3ACcfb77OPJBUCM0j8Rks+nftkrvsZsUEjQmLPTRFiAW5agIEg
 lE5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757080138; x=1757684938;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ohGQSMKwVj1UObMGtjXFeVfLrCd5JxxmvFAFzhxErEY=;
 b=wGXh1QtekzD1Ma5LTGtVjSA9M1GfjU6xEVCLlDP4lnuCk3pb09ZQHfPZ/nb/wMJTlg
 rqSd5U+rIscR/vPfiSomG50wWOl5KPVq82M5Z6zkOBiGgz9dKzPm+68M11eOMrSMidZy
 DVv3fco8FDm4JpvN5X/1xMAVqNp7XTbMC8NB/Lk3CFz6g1RLEDltInbwXaOdXQbqr1MM
 XAkQXTH+mhAKy1QL/IZA2AaAydHsqsWEVwv8piyIewu1h0zuH1vw/aaVdJqPLKq6uZa9
 QGYegr8xeFjwQhcLjphbmmIZaiWt37itId03WtzClFkrZvcMcSahCRwx5bOz9zEfF2LU
 V66Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4dpHuAZ6nTb+MOSns2lAv2jzvN7KHaTZsX0e7KOqDdrP6m2LLJ7xhr1k+4KYfVT4xz3cR0NGFHFbtvdimmQ==@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yz56L2ZNg9WVAVkuskppHc1MoG/3IBuxbehX8bAZ0VFu0pVssm3
 1pX0qKI3zE9GrGomg1kX3aECdr9Af5lWiSkOC1bouI5zg5ysNOlhqOX9MMqqFPLqS4w=
X-Gm-Gg: ASbGnctvDGsZXHr+zA//zB4uTYugmbtuzp1vfmcrGDP0zpd7oYHWREkHDp+1Wo+GQfC
 sJ6X86tVSgSsrV/UDhbuc4VMjG1YBy8cMYmCHXR4fuPfWTVv3UipsFKmkm50BlDjMz4Eyl/D6P5
 0rvoVX86zDT3fy71y5ukFkdS3GoMsQwjFRS8DxU36GkmYM7h58+1QJKN/SQ0RUpGc8mJjJoVzNO
 QhY2Yv4VGJE4znmn+Efkii2DPiZSMYSsJJMLbL6AirbeOSfHRzAlfTeCDY/LyWgF5ZSf4vptaYt
 XWGHz4Qp1+TyM1fZ2F2Y3hLoBfSnHpnLbKTxortmPRr+FUtbsJ9nPym+UaIl6PT76yYdybxrN4Y
 ZtAeebXFYKXfjCRBm0lPznI8nxfw83xVo6wDU
X-Google-Smtp-Source: AGHT+IG8kzDpVkryXwsWX0ypMJH1Q/GoqYF6znezUko5xKILYPDfjCeWqnLDJjEeRbeInNjICaV63A==
X-Received: by 2002:a17:907:86a4:b0:b04:4d7a:84f6 with SMTP id
 a640c23a62f3a-b044d7a8b80mr1329355866b.2.1757080138297; 
 Fri, 05 Sep 2025 06:48:58 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b0476e0d61esm496789166b.53.2025.09.05.06.48.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Sep 2025 06:48:57 -0700 (PDT)
Date: Fri, 5 Sep 2025 15:48:55 +0200
To: Marcos Paulo de Souza <mpdesouza@suse.com>
Message-ID: <aLrqR2l1A11lH_kV@pathway.suse.cz>
References: <20250902-nbcon-kgdboc-v3-0-cd30a8106f1c@suse.com>
 <20250902-nbcon-kgdboc-v3-1-cd30a8106f1c@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250902-nbcon-kgdboc-v3-1-cd30a8106f1c@suse.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue 2025-09-02 15:33:52, Marcos Paulo de Souza wrote: >
 The helper will be used on KDB code in the next commits. > > Signed-off-by:
 Marcos Paulo de Souza <mpdesouza@suse.com> Looks good: Reviewed-by: Petr
 Mladek <pmladek@suse.com> 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.48 listed in wl.mailspike.net]
X-Headers-End: 1uuWoQ-0001Dl-0L
Subject: Re: [Kgdb-bugreport] [PATCH v3 1/4] printk: nbcon: Export
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
 Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Daniel Thompson <danielt@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 kgdb-bugreport@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Tue 2025-09-02 15:33:52, Marcos Paulo de Souza wrote:
> The helper will be used on KDB code in the next commits.
> 
> Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>

Looks good:

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
